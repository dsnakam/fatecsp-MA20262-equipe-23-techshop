// Conf_Motivos — quantos registros estão rejeitados por cada regra
let
    Fonte = Table.SelectColumns(Rejeitados,{"Motivos_Rejeicao"}),
    Divididos = Table.TransformColumns(Fonte,{{"Motivos_Rejeicao",each Text.Split(_,"; "),type list}}),
    Linhas = Table.ExpandListColumn(Divididos,"Motivos_Rejeicao"),
    Agrupados = Table.Group(Linhas,{"Motivos_Rejeicao"},{{"Ocorrencias",each Table.RowCount(_),Int64.Type}}),
    Ordenado = Table.Sort(Agrupados,{{"Ocorrencias",Order.Descending}})
in Ordenado
