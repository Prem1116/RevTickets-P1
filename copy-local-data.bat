@echo off
echo This will copy data from your local MySQL (localhost:3306) to container MySQL
echo.
echo Make sure your local MySQL is running on port 3306
echo.
pause

docker exec revtickets-mysql mysql -uroot -proot -e "DROP DATABASE IF EXISTS mydb; CREATE DATABASE mydb;"

echo Copying data...
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump" -uroot -proot --host=localhost --port=3306 mydb | docker exec -i revtickets-mysql mysql -uroot -proot mydb

echo.
echo Data copied! Restart the app container:
docker-compose restart app
