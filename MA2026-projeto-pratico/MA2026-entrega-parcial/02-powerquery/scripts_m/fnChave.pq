// fnChave — normaliza maiúsculas e espaços, preserva acentos
(x as any) as text =>
let
    t = if x = null then "" else Text.Upper(Text.Trim(Text.Clean(Text.From(x)))),
    palavras = List.Select(Text.Split(t, " "), each _ <> ""),
    saida = Text.Combine(palavras, " ")
in
    saida
