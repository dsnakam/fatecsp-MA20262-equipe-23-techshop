// dLojista — dimensão de vendedores parceiros
let
    Fonte = Excel.Workbook(File.Contents(pArquivoEtapa1),true),
    Dados = Fonte{[Item="Tab_Lojistas",Kind="Table"]}[Data],
    Tipos = Table.TransformColumnTypes(Dados,{{"Cod_Lojista",type text},{"Lojista",type text},{"Razao_Social_Ficticia",type text},{"Cidade_Sede",type text},{"UF_Sede",type text}})
in Tipos
