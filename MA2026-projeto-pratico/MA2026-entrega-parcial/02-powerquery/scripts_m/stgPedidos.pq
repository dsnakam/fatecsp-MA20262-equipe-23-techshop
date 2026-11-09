// stgPedidos — leitura de pasta inteira e consolidação das três estruturas
let
    ColunasAlvo = {"Pedido_ID", "Data_Pedido", "Lojista", "SKU", "Produto", "Categoria", "Quantidade", "Valor_Unitario", "Status", "Motivo", "CEP", "UF", "Cidade", "Canal", "Dias_Despacho", "Desconto", "Linha_Origem"},
    Fonte = Folder.Files(pPastaPedidos),
    SoXlsx = Table.SelectRows(Fonte, each Text.Lower([Extension]) = ".xlsx" and not Text.StartsWith([Name],"~$")),
    Conteudo = Table.AddColumn(SoXlsx, "Dados", each
        let
            Pastas = Excel.Workbook([Content], true),
            Tabela = Pastas{[Item="Pedidos",Kind="Sheet"]}[Data]
        in fnPadronizarPedidos(Tabela)),
    Expandido = Table.ExpandTableColumn(Conteudo,"Dados",ColunasAlvo,ColunasAlvo),
    Mantidos = Table.SelectColumns(Expandido,{"Name"} & ColunasAlvo),
    Renomeado = Table.RenameColumns(Mantidos,{{"Name","Arquivo_Origem"}}),
    Ordenado = Table.Sort(Renomeado,{{"Arquivo_Origem",Order.Ascending},{"Linha_Origem",Order.Ascending}})
in Ordenado
