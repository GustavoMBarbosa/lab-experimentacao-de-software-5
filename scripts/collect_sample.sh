#!/bin/bash

OUTFILE="results.csv"

# Cabeçalho
echo "treatment,iteration,time_ms,response_size" > $OUTFILE

echo "Coletando amostras..."

for i in {1..30}; do
  echo "REST - Execução $i"
  rest=$(curl -w "%{time_total},%{size_download}" -s http://localhost:4000/api/users -o temp.out)
  time=$(echo $rest | cut -d"," -f1)
  size=$(echo $rest | cut -d"," -f2)
  echo "REST,$i,$time,$size" >> $OUTFILE

  echo "GraphQL - Execução $i"
  gql=$(curl -w "%{time_total},%{size_download}" \
    -s -X POST http://localhost:4000/graphql \
    -H "Content-Type: application/json" \
    -d '{"query":"{ users { id name email } }"}' -o temp.out)
  time=$(echo $gql | cut -d"," -f1)
  size=$(echo $gql | cut -d"," -f2)
  echo "GraphQL,$i,$time,$size" >> $OUTFILE
done

rm temp.out

echo "Coleta finalizada. Resultados em $OUTFILE"
