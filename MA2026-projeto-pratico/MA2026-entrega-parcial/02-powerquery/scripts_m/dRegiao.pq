// dRegiao — região por UF, sem consulta externa
let
    Fonte = Excel.Workbook(File.Contents(pArquivoEtapa1),true),
    Dados = Fonte{[Item="Tab_UF",Kind="Table"]}[Data],
    Tipos = Table.TransformColumnTypes(Dados,{{"UF",type text},{"Cidade_Referencia",type text},{"Regiao",type text}})
in Tipos
