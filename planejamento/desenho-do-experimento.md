# Desenho do Experimento

## A. Hipóteses
- **Hipótese Nula (H0):** Não há diferença significativa no tempo de resposta e no tamanho das respostas entre GraphQL e REST.
- **Hipótese Alternativa (H1):** GraphQL apresenta tempos de resposta menores e tamanhos de resposta menores que REST.

## B. Variáveis Dependentes
- **VD1:** Tempo de resposta (em milissegundos)
- **VD2:** Tamanho da resposta (em bytes)

## C. Variáveis Independentes
- **Tipo de API:** GraphQL vs REST

## D. Tratamentos
- **T1:** Consulta GraphQL
- **T2:** Consulta REST equivalente

## E. Objetos Experimentais
- Conjunto de dados de exemplo (ex: lista de usuários, produtos, pedidos)
- Servidor com API GraphQL e REST implementadas

## F. Tipo de Projeto Experimental
- Experimento intra-sujeito (mesmo conjunto de dados e ambiente para ambos os tratamentos)

## G. Quantidade de Medições
- **Número de repetições:** 30 execuções por tratamento (para garantir significância estatística)

## H. Ameaças à Validade
- **Ameaças internas:** Variação na carga do servidor, latência de rede, caching.
- **Ameaças externas:** Generalização para outros domínios ou tamanhos de dados.
- **Ameaças de construção:** Viés na implementação das APIs ou na medição.

