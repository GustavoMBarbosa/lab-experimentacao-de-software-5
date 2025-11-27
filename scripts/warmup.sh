---

```bash
#!/bin/bash
echo "Warm-up REST..."
for i in {1..20}; do curl -s http://localhost:4000/api/users > /dev/null; done

echo "Warm-up GraphQL..."
for i in {1..20}; do curl -s -X POST http://localhost:4000/graphql \
  -H "Content-Type: application/json" \
  -d '{"query":"{ users { id name } }"}' > /dev/null; done

echo "Warm-up complete."
