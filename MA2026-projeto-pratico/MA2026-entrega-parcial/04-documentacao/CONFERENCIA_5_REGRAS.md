# Atendimento das cinco regras de adaptação — Etapa 1

**1 — Preservar o procedimento:** a sequência de dados brutos → tabela Tratado com fórmulas → Cadastros/PROCX → Auditoria foi mantida. Valores inválidos permanecem visíveis; a remoção de duplicados é reservada à Etapa 2.

**2 — Usar os dados do próprio tema:** todos os pedidos, produtos, vendedores, preços, status, motivos, CEPs e metas são dados fictícios do projeto **TechShop Brasil (varejo/e-commerce)**, e não os dados CaféData.

**3 — Manter finalidade das estruturas:** exatamente `Bruto` (origem), `Tratado` (fórmulas/auxiliares), `Cadastros` (referência/de-para) e `Auditoria` (ocorrências, ações e situação).

**4 — Adaptar fórmulas e referências:** fórmulas adaptadas para `Pedido_ID`, SKU, lojista, data, status, motivo, quantidade, valor e CEP. Buscas principais via `XLOOKUP`/`PROCX`. O preço de referência é recuperado do cadastro; erro de preço >20% gera alerta, não correção inventada.

**5 — Preservar rastreabilidade:** os 16 campos originais são idênticos aos do arquivo bruto; `Tratado` inclui `Arquivo_Origem` e `Linha_Origem` dentro da tabela estruturada. A auditoria registra Pedido_ID, campo, valor, tipo de problema, ação, situação e observação, vinculada à linha original.

**Nota sobre o escopo integral:** as cinco regras dizem respeito principalmente à Etapa 1. As Etapas 2 e 3 contêm consultas Power Query e Modelo de Dados/Power Pivot nativos. Depois de mover o projeto para outra máquina, atualize os caminhos das fontes e confira os resultados no Excel Desktop.
