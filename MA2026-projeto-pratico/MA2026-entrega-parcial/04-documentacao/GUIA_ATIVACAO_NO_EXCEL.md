# Guia de ativação e validação no Excel Desktop

## Situação do pacote

Os três arquivos finais já contêm os componentes nativos do Excel Desktop. Não é preciso recriar consultas M, relacionamentos ou medidas DAX.

| Etapa | Arquivo | Componentes conferidos |
| --- | --- | --- |
| 1 | `01-excel/TechShop_01_Excel.xlsx` | abas Bruto, Tratado, Cadastros e Auditoria; a aba Bruto é somente origem e não deve ser editada |
| 2 | `02-powerquery/TechShop_02_PowerQuery.xlsx` | 19 consultas Power Query, conexões e tabelas carregadas |
| 3 | `03-powerpivot/TechShop_03_PowerPivot.xlsx` | Modelo de Dados com 7 tabelas, 6 relacionamentos, 25 medidas DAX e 5 Tabelas Dinâmicas nativas |

Use Microsoft Excel Desktop para Windows licenciado, com Power Query e a guia **Power Pivot** disponíveis. Não use Power BI como substituto.

## Antes de atualizar

1. Extraia o pacote inteiro sem alterar sua hierarquia.
2. Mantenha a pasta `dados_brutos` ao lado de `MA2026-entrega-parcial`.
3. Faça uma cópia do pacote antes de editar qualquer arquivo fonte. Os dados brutos não devem ser corrigidos manualmente: espaços, nomes e demais inconsistências fazem parte da demonstração de tratamento.
4. Se o projeto tiver sido movido para outro computador ou diretório, atualize apenas os parâmetros de caminho das consultas. O script `04-documentacao/Atualizar_Caminhos_TechShop.ps1` foi preparado para isso. Nenhuma consulta deve ser recriada.

## Etapa 1 — validação da planilha avançada

1. Abra `01-excel/TechShop_01_Excel.xlsx`.
2. Confira as abas **Bruto**, **Tratado**, **Cadastros** e **Auditoria**.
3. Em `Tratado`, confira que os valores tratados e os controles usam as colunas de tratamento; não altere nenhuma célula da aba **Bruto**.
4. Em `Auditoria`, as diferenças de conferência devem permanecer zero. A rastreabilidade deve apontar o campo e o valor que geraram cada exceção.

## Etapa 2 — Power Query nativo

1. Abra `02-powerquery/TechShop_02_PowerQuery.xlsx` no Excel Desktop.
2. Caso o Excel exiba o aviso de conteúdo externo para a pasta do próprio projeto, habilite-o somente se a pasta for confiável.
3. Vá em **Dados > Consultas e Conexões**. O painel deve listar **19 consultas**, incluindo `pPastaPedidos`, `stgPedidos`, `fPedidos`, `Rejeitados`, `fMetas` e as consultas de conferência.
4. Clique em **Dados > Atualizar Tudo** e aguarde a conclusão.
5. Na aba **Conferencia**, confirme os resultados abaixo:

| Indicador | Resultado esperado |
| --- | ---: |
| Registros lidos | 507 |
| Registros aceitos (`fPedidos`) | 474 |
| Registros rejeitados | 33 |
| Diferença de linhas | 0 |
| Produtos | 24 |
| Lojistas | 3 |
| Valor bruto | R$ 173.876,07 |
| Valor líquido | R$ 168.696,68 |

As consultas já estão carregadas como tabelas nas abas correspondentes. As consultas intermediárias podem aparecer como somente conexão; isso é normal e preserva a cadeia de dependências.

## Etapa 3 — Modelo de Dados, DAX e Tabelas Dinâmicas

1. Abra `03-powerpivot/TechShop_03_PowerPivot.xlsx`.
2. Clique em **Dados > Atualizar Tudo** e aguarde terminar. Isso atualiza as consultas que abastecem o modelo.
3. Abra **Power Pivot > Gerenciar > Exibição de Diagrama**. O modelo deve apresentar seis relacionamentos N:1 entre fato, dimensões, calendário e metas.
4. Em **Power Pivot > Medidas > Gerenciar Medidas**, confirme as 25 medidas DAX. Não é necessário digitá-las novamente.
5. As análises nativas já conectadas ao Modelo de Dados estão nas seguintes abas:

| Aba | Finalidade |
| --- | --- |
| `Planilha1` | análise mensal já existente |
| `Planilha2` | conferência de chaves e rejeitados |
| `PT_Lojista_Mes` | pedidos e valor dos pedidos por lojista e mês |
| `PT_Metas` | taxas, limites e desvios de cancelamento/devolução por lojista e mês |
| `PT_Categoria` | pedidos, valor dos pedidos e taxa de cancelamento por categoria |

6. Na aba `Conf_DAX_VALORCUBO`, cada linha usa uma fórmula nativa `VALORCUBO` ligada a `ThisWorkbookDataModel`. As 11 linhas devem mostrar **OK**:
   - `Pedidos = 474`;
   - `Valor Pedidos = 168.696,68`;
   - `Taxa Cancelamento = 15,400844%`;
   - `Taxa Devolucao = 13,502110%`;
   - conferências de pedidos, rejeitados e integridade das chaves conforme a coluna de referência.

## Evidências reais incluídas

As capturas foram registradas durante a execução no Excel Desktop:

- `02-powerquery/evidencias/editor_power_query.png` — Editor do Power Query com as consultas nativas;
- `03-powerpivot/evidencias/diagrama_relacionamentos.png` — Exibição de Diagrama do Power Pivot com os seis relacionamentos;
- `03-powerpivot/evidencias/medidas_dax.png` — janela Gerenciar Medidas DAX;
- `03-powerpivot/evidencias/tabela_dinamica_mensal.png` e `tabela_dinamica_integridade.png` — evidências das Tabelas Dinâmicas já existentes;
- `02-powerquery/evidencias/validacao_powerquery.json` e `03-powerpivot/evidencias/validacao_powerpivot.json` — inventários técnicos gerados pelo Excel.

## Se a atualização falhar após mover a pasta

O comportamento esperado é ajustar os parâmetros (`pPastaPedidos`, `pArquivoEtapa1`, `pArquivoMetas` e `pArquivoEtapa2`) para os novos caminhos locais e executar **Atualizar Tudo** de novo. Não cole o código M em células e não recrie tabelas do modelo. Depois da atualização, repita as conferências numéricas acima antes de apresentar o trabalho.


## Ajuste de caminho em outro computador (opcional)

Se precisar atualizar os arquivos depois de extrair o pacote, execute o script no PowerShell **na sessão do usuário que tem Excel Desktop licenciado**, com as pastas de trabalho fechadas. Exemplo a partir da pasta `MA2026-projeto-pratico`:

```powershell
& ".\MA2026-entrega-parcial\04-documentacao\Atualizar_Caminhos_TechShop.ps1" -RaizProjeto (Get-Location).Path
```

O script modifica apenas parâmetros de origem das consultas, cria backups locais e logs na pasta da execução, e não altera os dados brutos. Depois, abra e atualize primeiro a Etapa 2 e, em seguida, a Etapa 3. **Não é necessário rodá-lo para visualizar os resultados já armazenados.**
