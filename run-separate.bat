@echo off
echo Starting databases...
docker-compose up -d mysql mongo

echo.
echo Building backend...
cd revtickets-backend
call mvn clean package -DskipTests
cd ..

echo.
echo Building and starting backend...
docker-compose up -d backend

echo.
echo Building and starting frontend...
docker-compose up -d frontend

echo.
echo Services started!
echo Frontend: http://localhost:4200
echo Backend: http://localhost:8080
echo.
echo To view logs:
echo docker logs -f revtickets-frontend
echo docker logs -f revtickets-backend
