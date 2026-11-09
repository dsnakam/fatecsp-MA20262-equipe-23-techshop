// dProduto — catálogo original, fonte auxiliar da Etapa 1
let
    Fonte = Excel.Workbook(File.Contents(pArquivoEtapa1),true),
    Dados = Fonte{[Item="Tab_Produtos",Kind="Table"]}[Data],
    Tipos = Table.TransformColumnTypes(Dados,{{"Cod_Produto",type text},{"Produto",type text},{"Categoria",type text},{"Preco_Referencia",type number},{"Custo_Referencia",type number}},"pt-BR"),
    Codigo = Table.TransformColumns(Tipos,{{"Cod_Produto",fnChave,type text}})
in Codigo
