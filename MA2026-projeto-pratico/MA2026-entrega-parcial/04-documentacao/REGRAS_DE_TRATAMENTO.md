# Dicionário operacional de regras de limpeza — TechShop Brasil

## Rastreabilidade e chaves
- **Grão:** um item por pedido, simplificado. Chave única: `Pedido_ID`.
- Cada registro bruto tem `Arquivo_Origem` e `Linha_Origem` (a linha 1 é o cabeçalho).
- Os arquivos brutos são preservados; a Etapa 1 sinaliza os problemas, a Etapa 2 rejeita o que compromete chaves/análise.

## Erros que geram rejeição (dados indevidos para o modelo)
1. Pedido sem identificador / ID duplicado (mantém a primeira ocorrência válida por ordenação de arquivo e linha).
2. Lojista desconhecido (não inferir vendedor).
3. SKU não localizado no catálogo (não criar produtos arbitrariamente).
4. Data impossível ou vazia (não atribuir data imaginária).
5. Quantidade <= 0 ou diferente de inteiro positivo.
6. Valor unitário não numérico ou <= 0; desconto negativo.
7. Status não reconhecido pelo de-para.
8. Cancelado/Devolvido sem motivo reconhecido.
9. CEP com quantidade de dígitos distinta de 8 (controle sintático apenas).
10. Dias de despacho negativos ou inválidos.

## Alertas que **não** excluem a linha
- Divergência de categoria textual da fonte frente à categoria do cadastro (`Cod_Produto` prevalece).
- Desvio de preço em relação ao preço de referência superior a 20% (pode ser promoção ou exceção).
- Variações de nome de lojista corrigidas pelo de-para e valores monetários convertidos do padrão brasileiro.

## Conversão e enriquecimento
- Unificar três estruturas de cabeçalho com `fnPadronizarPedidos`.
- Identificar nomes de vendedor por `deParaLojista`, SKU por `dProduto`, região por UF em `dRegiao`.
- Tipar datas com formato pt-BR/ISO, números com localidade pt-BR, `Valor_Bruto` e `Valor_Liquido`.
- `Valor_Afetado = Valor_Liquido` somente se status Cancelado/Devolvido; do contrário zero.
- O arquivo de metas é uma matriz com dois indicadores e seis meses; Power Query deve despivotá-la para obter `fMetas` em formato longo.

## Estatísticas iniciais da simulação
- Linhas brutas: **507**.
- Aceitas: **474**.
- Rejeitadas: **33**.
- Ocorrências de erro (uma linha pode ter mais de uma): **33**.
- Ocorrências de alerta: **6**.

| Motivo de rejeição | Ocorrências |
|---|---:|
| CEP com formato inválido | 3 |
| Data inválida | 3 |
| Dias de despacho inválidos | 3 |
| Lojista sem correspondência | 3 |
| Motivo não reconhecido | 6 |
| Pedido duplicado | 3 |
| Quantidade inválida | 6 |
| SKU não cadastrado | 3 |
| Status fora da lista | 3 |
