@echo off
cd revtickets-backend
call mvn clean package -DskipTests
cd ..
docker-compose down
docker-compose build app
docker-compose up app
