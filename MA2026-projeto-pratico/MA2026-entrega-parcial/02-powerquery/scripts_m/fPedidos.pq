// fPedidos — aceita somente linhas sem rejeições; preserva chaves e arquivo/linha
let
    Fonte = Table.SelectRows(stgAvaliado, each (try [Motivos_Rejeicao] = "" otherwise false)),
    Resultado = Table.SelectColumns(Fonte,{
        "Pedido_ID","Data_Trat","Mes_Inicio","Cod_Lojista","SKU","UF","Qtd_Trat",
        "Valor_Unit_Trat","Desconto_Trat","Valor_Bruto","Valor_Liquido","Valor_Afetado",
        "Status_Trat","Motivo_Trat","CEP","Cidade","Canal_Trat","Dias_Trat",
        "Arquivo_Origem","Linha_Origem"}),
    Renomeado = Table.RenameColumns(Resultado,{
        {"Data_Trat","Data_Pedido"},{"SKU","Cod_Produto"},{"Qtd_Trat","Quantidade"},
        {"Valor_Unit_Trat","Valor_Unitario"},{"Desconto_Trat","Desconto"},
        {"Status_Trat","Status"},{"Motivo_Trat","Motivo"},{"Canal_Trat","Canal"},
        {"Dias_Trat","Dias_Despacho"}}),
    Tipos = Table.TransformColumnTypes(Renomeado,{{"Pedido_ID",type text},{"Data_Pedido",type date},{"Mes_Inicio",type date},{"Cod_Lojista",type text},{"Cod_Produto",type text},{"UF",type text},{"Quantidade",Int64.Type},{"Valor_Unitario",Currency.Type},{"Desconto",Currency.Type},{"Valor_Bruto",Currency.Type},{"Valor_Liquido",Currency.Type},{"Valor_Afetado",Currency.Type},{"Status",type text},{"Motivo",type text},{"CEP",type text},{"Cidade",type text},{"Canal",type text},{"Dias_Despacho",Int64.Type},{"Arquivo_Origem",type text},{"Linha_Origem",Int64.Type}},"pt-BR")
in Tipos
