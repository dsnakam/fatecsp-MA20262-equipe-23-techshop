# Dicionário de dados — TechShop Brasil

**Todos os dados são fictícios**. Datas: janeiro a junho de 2026. Valores em reais nominais, sem indexação ou fontes externas.

## Base bruta

| Campo canônico | Tipo lógico | Significado |
|---|---|---|
| Pedido_ID | Texto | Identificador único do pedido/item |
| Data_Pedido | Data/texto | Data original com variações de formato |
| Lojista | Texto | Nome informado pelo parceiro, sujeito a variações |
| SKU | Texto | Código informado do produto |
| Produto | Texto | Nome do item registrado, não confiável como chave |
| Categoria | Texto | Categoria livre no arquivo bruto |
| Quantidade | Inteiro/texto | Quantidade do item |
| Valor_Unitario | Decimal/texto | Preço unitário de registro (BRL) |
| Status | Texto | Concluído, Cancelado, Devolvido (com aliases) |
| Motivo | Texto | Descrição de problema para status Cancelado/Devolvido |
| CEP | Texto | CEP **fictício** de 8 dígitos para teste de validação |
| UF | Texto | UF simulada do comprador |
| Cidade | Texto | Cidade simulada compatível com a UF |
| Canal | Texto | Site, Aplicativo, Marketplace |
| Dias_Despacho | Inteiro | Tempo informado entre pedido e despacho |
| Desconto | Decimal | Desconto monetário total do pedido |

## Base limpa / Fato

| Campo | Tipo | Cálculo ou origem |
|---|---|---|
| Pedido_ID | Chave texto | Preservado e deduplicado |
| Data_Pedido | Data | fnData |
| Mes_Inicio | Data | Primeiro dia do mês do pedido |
| Cod_Lojista | FK texto | De-para de nomes do lojista |
| Cod_Produto | FK texto | SKU válido do catálogo |
| UF | FK texto | UF do comprador (dRegiao) |
| Quantidade | Inteiro | fnNumero + validação |
| Valor_Unitario | Moeda | fnNumero |
| Desconto | Moeda | fnNumero |
| Valor_Bruto | Moeda | Quantidade × Valor_Unitario |
| Valor_Liquido | Moeda | Valor_Bruto − Desconto |
| Valor_Afetado | Moeda | Valor_Liquido se cancelado/devolvido; senão 0 |
| Status | Texto | De-para status |
| Motivo | Texto | De-para motivo, em branco para concluído |
| CEP, Cidade, Canal, Dias_Despacho | Texto/inteiro | Traços logísticos simulados |
| Arquivo_Origem, Linha_Origem | Texto/inteiro | Auditoria e rastreabilidade |

## Dimensões e metas

- `dProduto`: Cod_Produto (PK), Produto, Categoria, Preco_Referencia, Custo_Referencia.
- `dLojista`: Cod_Lojista (PK), Lojista, Razao_Social_Ficticia, Cidade_Sede, UF_Sede.
- `dRegiao`: UF (PK), Cidade_Referencia, Regiao.
- `dCalendario`: Data (PK), Ano, Mes, Nome_Mes, AnoMes, Mes_Inicio, Dia_Semana.
- `fMetas`: Cod_Lojista, Mes_Inicio (chave composta lógica), Limite_Cancelamento, Limite_Devolucao. Limites percentuais entre 0 e 1; **menor taxa real significa melhor desempenho**.
