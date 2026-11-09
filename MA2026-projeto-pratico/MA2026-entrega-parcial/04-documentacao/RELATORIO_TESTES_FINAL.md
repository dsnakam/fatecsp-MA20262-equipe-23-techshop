# Relatório de testes finais — TechShop Equipe 23

Data da validação: 08/11/2026, 21:46 (America/Sao_Paulo).

## Escopo preservado

- A Etapa 1 e os arquivos em `dados_brutos` não foram abertos para alteração nesta finalização.
- As consultas M, o Modelo de Dados, os seis relacionamentos e as 25 medidas DAX existentes não foram recriados.
- Foi criado backup da Etapa 3 antes das conferências `VALORCUBO` e backup das Etapas 2 e 3 antes do teste de atualização.

## Componentes acrescentados na Etapa 3

| Entrega | Local | Comprovação |
| --- | --- | --- |
| Análise por lojista e mês | `PT_Lojista_Mes` | Tabela Dinâmica nativa ligada ao Modelo de Dados |
| Comparação de metas | `PT_Metas` | taxa, limite e desvio de cancelamento/devolução por lojista e mês |
| Análise por categoria | `PT_Categoria` | pedidos, valor dos pedidos e taxa de cancelamento |
| Conferência de medidas | `Conf_DAX_VALORCUBO` | 11 fórmulas nativas `VALORCUBO` e 11 situações `OK` |

O arquivo passa a conter cinco Tabelas Dinâmicas nativas: as duas existentes (`Planilha1` e `Planilha2`) e as três novas.

## Atualizar Tudo e resultados

`Atualizar Tudo` foi executado no Excel Desktop em 08/11/2026 às 21:38. A inspeção técnica posterior foi registrada nos logs de desenvolvimento. O inventário de resultados aprovado está reproduzido na tabela abaixo; logs temporários não foram incluídos neste pacote de entrega.

| Verificação | Resultado |
| --- | ---: |
| Consultas Power Query da Etapa 2 | 19 |
| Conexões da Etapa 2 | 9 |
| Registros lidos / aceitos / rejeitados | 507 / 474 / 33 |
| Diferença de linhas | 0 |
| Valor bruto / líquido | R$ 173.876,07 / R$ 168.696,68 |
| Produtos / lojistas | 24 / 3 |
| Consultas da Etapa 3 | 9 |
| Tabelas do Modelo de Dados | 7 |
| Relacionamentos | 6 |
| Medidas DAX | 25 |
| Dias no calendário | 181 |
| Tabelas Dinâmicas do Modelo | 5 |
| Conferências `VALORCUBO` | 11 de 11 OK |

## Evidências reais geradas no Excel Desktop

- `02-powerquery/evidencias/editor_power_query.png`;
- `03-powerpivot/evidencias/diagrama_relacionamentos.png`;
- `03-powerpivot/evidencias/medidas_dax.png`.

As três capturas foram feitas em telas reais do Editor do Power Query, da Exibição de Diagrama do Power Pivot e de Gerenciar Medidas DAX. Elas não são imagens simuladas nem substituem os componentes incorporados no arquivo `.xlsx`.
