// fnNumero — números/valores em cultura brasileira, inclusive "R$ 249,90"
(x as any) as nullable number =>
let
    v = if x = null then null else if Value.Is(x, type number) then Number.From(x) else
        let
            txt = Text.Trim(Text.Replace(Text.Replace(Text.From(x), "R$", ""), " ", "")),
            br = try Number.FromText(txt, "pt-BR") otherwise null,
            en = if br = null then (try Number.FromText(txt, "en-US") otherwise null) else br
        in en
in v
