@echo off
echo Warm-up REST...
for /l %%i in (1,1,20) do curl -s http://localhost:4000/api/users > nul

echo Warm-up GraphQL...
for /l %%i in (1,1,20) do curl -s -X POST http://localhost:4000/graphql ^
 -H "Content-Type: application/json" ^
 -d "{\"query\":\"{ users { id name email } }\"}" > nul

echo Warm-up completo!
pause
