// fMetas — despivotar tabela de metas de qualidade de meses em colunas
let
    Fonte = Excel.Workbook(File.Contents(pArquivoMetas),true),
    Bruta = Fonte{[Item="Metas",Kind="Sheet"]}[Data],
    Longa = Table.UnpivotOtherColumns(Bruta,{"Cod_Lojista","Indicador"},"AnoMes","Meta"),
    Organizada = Table.Pivot(Longa,List.Distinct(Longa[Indicador]),"Indicador","Meta",List.Sum),
    ComMes = Table.AddColumn(Organizada,"Mes_Inicio",each Date.FromText([AnoMes] & "-01"),type date),
    Retido = Table.SelectColumns(ComMes,{"Cod_Lojista","Mes_Inicio","Limite_Cancelamento","Limite_Devolucao"}),
    Tipos = Table.TransformColumnTypes(Retido,{{"Cod_Lojista",type text},{"Mes_Inicio",type date},{"Limite_Cancelamento",type number},{"Limite_Devolucao",type number}},"pt-BR")
in Tipos
