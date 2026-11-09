// deParaLojista — mapeamento de grafias conhecidas de lojista
let
    Fonte = Excel.Workbook(File.Contents(pArquivoEtapa1),true),
    Dados = Fonte{[Item="Tab_DePara_Lojistas",Kind="Table"]}[Data],
    Nomes = Table.RenameColumns(Dados,{{"Lojista_Origem","Nome_Origem"}}),
    Tipos = Table.TransformColumnTypes(Nomes,{{"Nome_Origem",type text},{"Cod_Lojista",type text}}),
    ComChave = Table.AddColumn(Tipos,"Chave_Lojista",each fnChave([Nome_Origem]),type text),
    SemDuplicatas = Table.Distinct(ComChave,{"Chave_Lojista"})
in SemDuplicatas
