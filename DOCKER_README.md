# Docker Setup for RevTickets

## Build Options

### Option 1: Run Frontend and Backend in ONE Container

This runs both Angular frontend and Spring Boot backend in a single container.

**Prerequisites:**
```bash
cd revtickets-backend
mvn clean package
cd ..
```

**Build and Run:**
```bash
docker-compose up app
```

Access:
- Frontend: http://localhost:4201
- Backend: http://localhost:8081

### Option 2: Run Frontend and Backend in SEPARATE Containers

**Prerequisites:**
```bash
cd revtickets-backend
mvn clean package
cd ..
```

**Build and Run:**
```bash
docker-compose up backend frontend
```

Access:
- Frontend: http://localhost:4200
- Backend: http://localhost:8080

### Option 3: Run Everything (Databases + App)

**Build and Run:**
```bash
cd revtickets-backend
mvn clean package
cd ..
docker-compose up
```

This starts:
- MySQL (port 3307)
- MongoDB (port 27017)
- Backend (port 8080)
- Frontend (port 4200)
- Combined App (ports 8081, 4201)

## Individual Docker Builds

### Backend Only:
```bash
cd revtickets-backend
mvn clean package
docker build -t revtickets-backend .
docker run -p 8080:8080 revtickets-backend
```

### Frontend Only:
```bash
cd revtickets-frontend
docker build -t revtickets-frontend .
docker run -p 4200:4200 revtickets-frontend
```

### Combined Container:
```bash
cd revtickets-backend
mvn clean package
cd ..
docker build -t revtickets-app .
docker run -p 4200:4200 -p 8080:8080 revtickets-app
```

## Stop Containers

```bash
docker-compose down
```

## Clean Up

```bash
docker-compose down -v
docker system prune -a
```
