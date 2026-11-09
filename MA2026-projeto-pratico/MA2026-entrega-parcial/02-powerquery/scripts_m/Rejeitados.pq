// Rejeitados — todas as linhas descartadas, sem omitir motivo ou fonte
let
    Filtrados = Table.SelectRows(stgAvaliado, each [Motivos_Rejeicao] <> ""),
    Colunas = {"Pedido_ID","Data_Pedido","Lojista","SKU","Produto","Categoria","Quantidade","Valor_Unitario","Status","Motivo","CEP","UF","Cidade","Canal","Dias_Despacho","Desconto","Arquivo_Origem","Linha_Origem","Motivos_Rejeicao"},
    Resultado = Table.SelectColumns(Filtrados,Colunas)
in Resultado
