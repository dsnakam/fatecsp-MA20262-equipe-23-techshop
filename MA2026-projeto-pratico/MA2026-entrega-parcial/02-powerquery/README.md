# Etapa 2 — Power Query | TechShop Brasil

O arquivo `TechShop_02_PowerQuery.xlsx` contém consultas Power Query nativas que consolidam os três arquivos brutos de pedidos e consultam os cadastros da Etapa 1.

- Entradas: `../../dados_brutos/pedidos/`, `../01-excel/TechShop_01_Excel.xlsx` e `../../dados_brutos/metas_qualidade_SIMULADO.xlsx` (caminhos relativos apenas nesta documentação; no Power Query há parâmetros locais configuráveis).
- Saídas: `fPedidos` (474), `Rejeitados` (33), `dProduto`, `dLojista`, `dRegiao`, `fMetas` e tabelas de conferência.
- Os códigos M estão em `scripts_m/*.pq`; a exportação dos registros aceitos está em `dados_limpos/fPedidos.csv` (CSV UTF-8).
- Capturas reais estão em `evidencias/`.
- Regras de rejeição: registros inválidos, sem cadastro e duplicações, conforme `../04-documentacao/REGRAS_DE_TRATAMENTO.md`.

Para atualizar em outro computador, leia `../04-documentacao/GUIA_ATIVACAO_NO_EXCEL.md`. Validação esperada: 507 lidas = 474 aceitas + 33 rejeitadas. Os parâmetros de caminho devem apontar para os arquivos deste pacote.
