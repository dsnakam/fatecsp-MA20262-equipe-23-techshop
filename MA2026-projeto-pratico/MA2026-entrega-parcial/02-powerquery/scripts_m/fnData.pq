// fnData — aceita data nativa, dd/mm/aaaa, dd-mm-aaaa e ISO
(x as any) as nullable date =>
let
    primeiro = try Date.From(x) otherwise null,
    texto = if x = null then "" else Text.Trim(Text.From(x)),
    ptbr = if primeiro <> null then primeiro else (try Date.FromText(texto, [Culture="pt-BR"]) otherwise null),
    final = if ptbr <> null then ptbr else (try Date.FromText(texto, [Culture="en-US"]) otherwise null)
in final
