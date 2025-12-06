@echo off
echo Building backend...
cd revtickets-backend
call mvn clean package -DskipTests
cd ..

echo.
echo Stopping existing containers...
docker-compose down app

echo.
echo Building Docker image...
docker-compose build app

echo.
echo Starting container...
docker-compose up -d app

echo.
echo Waiting for services to start...
timeout /t 10

echo.
echo Container status:
docker ps -a | findstr revtickets-app

echo.
echo To view logs, run: docker logs -f revtickets-app
echo Frontend: http://localhost:4201
echo Backend: http://localhost:8081
