// Conf_Reconciliacao — zero é o resultado obrigatório para Diferença
let
    Lidos = Table.RowCount(stgPedidos),
    Aceitos = Table.RowCount(fPedidos),
    RejeitadosN = Table.RowCount(Rejeitados),
    Diferenca = Lidos - Aceitos - RejeitadosN,
    Saida = #table(type table [Linhas_Lidas=number, Linhas_Aceitas=number, Linhas_Rejeitadas=number, Diferenca=number],{{Lidos,Aceitos,RejeitadosN,Diferenca}})
in Saida
