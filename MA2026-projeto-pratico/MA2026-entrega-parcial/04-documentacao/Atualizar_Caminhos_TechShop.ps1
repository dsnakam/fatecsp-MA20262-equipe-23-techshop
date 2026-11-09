<#
Atualiza somente os parâmetros de caminho já existentes nas consultas nativas.
Use depois de mover/extrair a pasta TechShop_Equipe23 em outro computador.
Não altera dados brutos, tabelas do Modelo de Dados, relações nem medidas DAX.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$RaizProjeto
)

$ErrorActionPreference = 'Stop'
$RaizProjeto = (Resolve-Path -LiteralPath $RaizProjeto).Path
$etapa2 = Join-Path $RaizProjeto 'MA2026-entrega-parcial\02-powerquery\TechShop_02_PowerQuery.xlsx'
$etapa3 = Join-Path $RaizProjeto 'MA2026-entrega-parcial\03-powerpivot\TechShop_03_PowerPivot.xlsx'
$pastaPedidos = Join-Path $RaizProjeto 'dados_brutos\pedidos'
$arquivoEtapa1 = Join-Path $RaizProjeto 'MA2026-entrega-parcial\01-excel\TechShop_01_Excel.xlsx'
$arquivoMetas = Join-Path $RaizProjeto 'dados_brutos\metas_qualidade_SIMULADO.xlsx'
$carimbo = Get-Date -Format 'yyyyMMdd_HHmmss'
$pastaBackups = Join-Path $RaizProjeto '_backups'
$pastaLogs = Join-Path $RaizProjeto 'logs'
$log = Join-Path $pastaLogs ("atualizacao_caminhos_{0}.log" -f $carimbo)

New-Item -ItemType Directory -Force -Path $pastaBackups, $pastaLogs | Out-Null

foreach ($caminho in @($etapa2, $etapa3, $pastaPedidos, $arquivoEtapa1, $arquivoMetas)) {
    if (-not (Test-Path -LiteralPath $caminho)) {
        throw "Item obrigatório não encontrado: $caminho"
    }
}

$excel = $null
$abertos = @()

function Set-ConsultaFormula {
    param(
        [Parameter(Mandatory = $true)]$Pasta,
        [Parameter(Mandatory = $true)][string]$Nome,
        [Parameter(Mandatory = $true)][string]$Formula
    )
    try {
        $Pasta.Queries.Item($Nome).Formula = $Formula
    }
    catch {
        throw "Consulta '$Nome' não localizada em '$($Pasta.Name)'."
    }
}

try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $excel.AskToUpdateLinks = $false

    foreach ($arquivo in @($etapa2, $etapa3)) {
        $backup = Join-Path $pastaBackups (([IO.Path]::GetFileNameWithoutExtension($arquivo)) + "_antes_caminhos_{0}.xlsx" -f $carimbo)
        Copy-Item -LiteralPath $arquivo -Destination $backup -Force
        Add-Content -LiteralPath $log -Encoding UTF8 -Value "Backup criado: $backup"
    }

    $wb2 = $excel.Workbooks.Open($etapa2, 0, $false)
    $abertos += $wb2
    Set-ConsultaFormula -Pasta $wb2 -Nome 'pPastaPedidos' -Formula ('"' + $pastaPedidos + '"')
    Set-ConsultaFormula -Pasta $wb2 -Nome 'pArquivoEtapa1' -Formula ('"' + $arquivoEtapa1 + '"')
    Set-ConsultaFormula -Pasta $wb2 -Nome 'pArquivoMetas' -Formula ('"' + $arquivoMetas + '"')
    $wb2.Save()

    $wb3 = $excel.Workbooks.Open($etapa3, 0, $false)
    $abertos += $wb3
    Set-ConsultaFormula -Pasta $wb3 -Nome 'pArquivoEtapa2' -Formula ('"' + $etapa2 + '"')
    $wb3.Save()

    [PSCustomObject]@{
        Etapa2_pPastaPedidos = $wb2.Queries.Item('pPastaPedidos').Formula
        Etapa2_pArquivoEtapa1 = $wb2.Queries.Item('pArquivoEtapa1').Formula
        Etapa2_pArquivoMetas = $wb2.Queries.Item('pArquivoMetas').Formula
        Etapa3_pArquivoEtapa2 = $wb3.Queries.Item('pArquivoEtapa2').Formula
    } | ConvertTo-Json -Depth 3 | Set-Content -LiteralPath $log -Encoding UTF8

    Write-Output "Caminhos atualizados. Abra a Etapa 2, use Dados > Atualizar Tudo e salve. Depois abra a Etapa 3, use Dados > Atualizar Tudo e salve."
    Write-Output "Log: $log"
}
finally {
    foreach ($pasta in $abertos) {
        try { $pasta.Close($false) } catch { }
    }
    if ($excel) {
        $excel.Quit()
        [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($excel)
    }
}
