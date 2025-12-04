# Laboratório 05 – GraphQL vs REST: Um Experimento Controlado

## 1. Informações do grupo

* Curso: Engenharia de Software  
* Disciplina: Laboratório de Experimentação de Software  
* Período: 6° Período  
* Membros do Grupo: Gabriel Henrique Silva Pereira e Gustavo Menezes Barbosa  

---

# 2. Introdução

O objetivo deste Laboratório 05 é avaliar quantitativamente diferenças entre APIs desenvolvidas em GraphQL e em REST, considerando dois critérios principais: tempo de resposta e tamanho da resposta. Essas duas métricas são frequentemente discutidas na literatura como potenciais vantagens do uso de GraphQL, mas evidências empíricas claras nem sempre são disponibilizadas.

O estudo foi conduzido por meio de um experimento controlado, no qual consultas equivalentes foram realizadas em ambas as arquiteturas. A análise realizada nesta Sprint 2 responde às perguntas de pesquisa definidas no laboratório:

* RQ1. Respostas às consultas GraphQL são mais rápidas que respostas às consultas REST?  
* RQ2. Respostas às consultas GraphQL têm tamanho menor que respostas às consultas REST?  

O desenho do experimento, definido na Sprint 1, incluiu hipóteses, variáveis, tratamentos, objetos experimentais e ameaças à validade, servindo como base para a execução realizada nesta etapa.

---

## 2.1 Hipóteses Formais

As hipóteses utilizadas, conforme definidas na Sprint 1, foram:

* **H0:** Não há diferença significativa no tempo de resposta nem no tamanho das respostas entre GraphQL e REST.  
* **H1:** GraphQL apresenta tempos de resposta menores e tamanhos de resposta menores que REST.

---

# 3. Metodologia

A metodologia seguida nesta etapa engloba a execução prática do experimento, a coleta das medições e a análise estatística dos dados resultantes.

---

## 3.1 Execução do Experimento

As consultas foram executadas em ambiente controlado usando Docker Compose, garantindo condições homogêneas para ambos os tratamentos. Os dois tratamentos aplicados foram:

* T1: Consulta REST  
* T2: Consulta GraphQL equivalente  

Para cada tratamento, foram realizadas 30 execuções, totalizando 60 medições.

O arquivo resultante das execuções foi:

* **results.csv**

Com as seguintes colunas:

* `treatment` – REST ou GraphQL  
* `iteration` – número da repetição  
* `time_ms` – tempo da requisição (em segundos)  
* `response_size` – tamanho da resposta em bytes  

---

## 3.2 Pré-processamento e revisão dos dados

Os dados foram carregados e validados. Não foram encontrados valores faltantes ou anômalos. Os tamanhos das respostas se mantiveram constantes dentro de cada tratamento, o que simplifica a análise da RQ2. Para RQ1, foi realizada uma análise descritiva e posteriormente um teste t (t-test) para comparação dos tempos de resposta entre as arquiteturas.

---

# 4. Resultados

A análise dos resultados permitiu avaliar separadamente cada uma das RQs do laboratório. A seguir, são apresentados os achados relativos ao tempo de resposta e ao tamanho da resposta.

---

## 4.1 Tempo de Resposta (RQ1)

A tabela abaixo apresenta as médias observadas:

| Tratamento | Tempo Médio |
|-----------|--------------|
| REST      | 0.002651 s   |
| GraphQL   | 0.003117 s   |

O teste t-student (variâncias não iguais) apresentou:

* **t = –6.00**  
* **p = 1.85 × 10⁻⁷**

Como p < 0.05, rejeita-se a hipótese nula para o tempo de resposta.

**Interpretação:**  
O tempo médio de respostas REST foi significativamente menor que o de GraphQL nas condições do experimento. Portanto, para este ambiente e dados, GraphQL **não** apresentou respostas mais rápidas.

---

## 4.2 Tamanho das Respostas (RQ2)

Os tamanhos observados foram constantes:

| Tratamento | Tamanho Médio |
|-----------|----------------|
| REST      | 158 bytes      |
| GraphQL   | 167 bytes      |

Como os valores não variam dentro de cada grupo, não há necessidade de teste estatístico adicional.

**Interpretação:**  
As respostas REST foram sempre menores do que as respostas GraphQL. Assim, a hipótese de que GraphQL oferece respostas menores não se confirmou. No contexto deste experimento, GraphQL produziu respostas maiores.

---

# 5. Discussão

Os resultados obtidos divergem da expectativa comum de que GraphQL oferece maior eficiência em termos de tamanho de resposta e, às vezes, de tempo. Para o cenário do experimento, observaram-se dois aspectos importantes:

1. **REST foi mais rápido.**  
   O tempo médio de resposta REST foi menor, e a diferença foi estatisticamente significativa. Isso indica que o processamento adicional necessário para resolver consultas GraphQL pode ter impacto perceptível em ambientes simples.

2. **REST enviou respostas menores.**  
   Os tamanhos padronizados sugerem que, para a consulta implementada, a resposta GraphQL continha metadados adicionais ou estrutura mais complexa. Isso é consistente com o formato tradicional de respostas GraphQL, que adiciona camadas estruturais adicionais.

3. **A vantagem de GraphQL depende do caso de uso.**  
   Consultas mais complexas, que evitam overfetching, podem se beneficiar mais de GraphQL. Porém, no caso deste experimento — com consultas equivalentes e dados homogêneos — tais benefícios não se manifestaram.

4. **As ameaças à validade permanecem relevantes.**  
   A performance absoluta pode variar segundo o hardware, rede, complexidade das queries e implementação das APIs. Entretanto, no contexto controlado utilizado, as conclusões são consistentes.

---

# 6. Conclusão Final

O experimento desenvolvido nesta Sprint 2 permitiu responder empiricamente às perguntas de pesquisa.

**Resultados finais:**

* **RQ1 – Tempo:** REST foi significativamente mais rápido que GraphQL.  
* **RQ2 – Tamanho da resposta:** REST produziu respostas menores que GraphQL.

Portanto, **ambas as hipóteses alternativas foram rejeitadas** neste estudo: GraphQL não apresentou maior eficiência que REST para os critérios avaliados.