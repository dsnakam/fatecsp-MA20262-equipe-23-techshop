// fnTabelaEtapa2 — lê tabela do arquivo carregado pelo Power Query
(nome as text) as table =>
let
    Fonte = Excel.Workbook(File.Contents(pArquivoEtapa2),true),
    Resultado = Fonte{[Item="Tab_" & nome,Kind="Table"]}[Data]
in Resultado
