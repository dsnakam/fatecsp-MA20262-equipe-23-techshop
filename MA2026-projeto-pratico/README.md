# TechShop Brasil — Equipe 23

**Microinformática Aplicada | FATEC São Paulo | N1 (Etapas 1, 2 e 3)**

Dados **100% simulados** para o projeto de varejo/e-commerce, com foco em cancelamentos e devoluções de pedidos de três lojistas. O modelo de referência técnica utilizado pelo professor é a rede CaféData, mas os dados e indicadores aqui correspondem à TechShop.

## Onde estão as entregas

| Etapa | Artefato | O que contém |
| --- | --- | --- |
| 1. Excel Avançado | `MA2026-entrega-parcial/01-excel/TechShop_01_Excel.xlsx` | Abas `Bruto`, `Tratado`, `Cadastros` e `Auditoria`, fórmulas, cadastros e rastreabilidade. |
| 2. Power Query | `MA2026-entrega-parcial/02-powerquery/TechShop_02_PowerQuery.xlsx` | Consultas M nativas, dados consolidados, rejeitados e reconciliação. Scripts M, CSV tratado e evidências ficam na pasta da etapa. |
| 3. Power Pivot/DAX | `MA2026-entrega-parcial/03-powerpivot/TechShop_03_PowerPivot.xlsx` | Modelo de Dados nativo, seis relacionamentos, medidas DAX, Tabelas Dinâmicas e conferências `VALORCUBO`. Scripts, DAX e capturas ficam na pasta da etapa. |

As fontes originais estão em `dados_brutos/` e devem ser preservadas sem correções diretas. A proposta, o dicionário de dados, as regras e a conferência técnica estão em `MA2026-entrega-parcial/04-documentacao/`.

## Totais de referência da simulação

| Indicador | Valor |
| --- | ---: |
| Registros brutos | 507 |
| Pedidos aceitos | 474 |
| Pedidos rejeitados | 33 |
| Concluídos / cancelados / devolvidos | 337 / 73 / 64 |
| Produtos / lojistas / dias do calendário | 24 / 3 / 181 |
| Valor bruto dos aceitos | R$ 173.876,07 |
| Valor líquido dos aceitos | R$ 168.696,68 |
| Valor afetado | R$ 50.979,64 |

## O que foi conferido

Os arquivos Excel foram mantidos **byte a byte**, para preservar consultas, Modelo de Dados, relacionamentos, Tabelas Dinâmicas e fórmulas. A inspeção estrutural verificou arquivos XLSX íntegros, referências e valores salvos; a verificação das 16 colunas originais em 169 linhas da Etapa 1 não encontrou divergências de texto ou valor em relação ao original, exceto diferenças insignificantes de representação binária decimal. Os logs anteriores da execução no Excel informam atualização bem-sucedida e 11 medidas `VALORCUBO` com resultados `OK`.

**Limite da conferência:** a reorganização não executou o Excel Desktop; em outra máquina, caminhos absolutos das fontes precisam ser reconfigurados para que `Atualizar Tudo` funcione novamente. Use o guia de ativação em `04-documentacao` e, se necessário, o script `Atualizar_Caminhos_TechShop.ps1` incluído nessa pasta. A inclusão do script é intencional: é o único utilitário necessário para atualizar os caminhos sem refazer o Power Query/Power Pivot.

> Os backups, logs de desenvolvimento, scripts auxiliares de geração e relatórios temporários foram excluídos apenas da cópia de entrega. Nenhum arquivo Excel foi modificado.
