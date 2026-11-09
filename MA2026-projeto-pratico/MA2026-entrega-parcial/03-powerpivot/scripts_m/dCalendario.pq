// dCalendario — 181 dias (2026-01-01 até 2026-06-30)
let
    Inicio = #date(2026,1,1),
    Fim = #date(2026,6,30),
    Datas = List.Dates(Inicio,Duration.Days(Fim-Inicio)+1,#duration(1,0,0,0)),
    Tabela = Table.FromList(Datas,Splitter.SplitByNothing(),{"Data"}),
    Data = Table.TransformColumnTypes(Tabela,{{"Data",type date}}),
    Ano = Table.AddColumn(Data,"Ano",each Date.Year([Data]),Int64.Type),
    Mes = Table.AddColumn(Ano,"Mes",each Date.Month([Data]),Int64.Type),
    Nome = Table.AddColumn(Mes,"Nome_Mes",each Date.ToText([Data],"MMM","pt-BR"),type text),
    AnoMes = Table.AddColumn(Nome,"AnoMes",each Date.ToText([Data],"yyyy-MM"),type text),
    MesInicio = Table.AddColumn(AnoMes,"Mes_Inicio",each Date.StartOfMonth([Data]),type date),
    DiaSemana = Table.AddColumn(MesInicio,"Dia_Semana",each Date.DayOfWeek([Data],Day.Monday)+1,Int64.Type)
in DiaSemana
