# RevTickets - Event Booking System

A full-stack event booking application with CI/CD pipeline.

## 🚀 Quick Start

### Prerequisites
- Docker Desktop
- Git
- Jenkins (optional, for CI/CD)

### 1. Clone Repository
```bash
git clone https://github.com/Prem1116/RevTickets-P1.git
cd RevTickets-P1
```

### 2. Run Application
```bash
docker-compose up -d
```

### 3. Access Application
- **Frontend:** http://localhost:4200
- **Backend API:** http://localhost:8081
- **MySQL:** localhost:3307
- **MongoDB:** localhost:27017

## 🏗️ Architecture

- **Frontend:** Angular 18 + Angular Material
- **Backend:** Spring Boot 3.2 + JPA + MongoDB
- **Database:** MySQL 8.0 + MongoDB 7.0
- **Containerization:** Docker + Docker Compose
- **CI/CD:** Jenkins Pipeline

## 📋 Features

- User registration and authentication
- Event browsing and booking
- Seat selection and payment
- Admin dashboard
- Real-time notifications
- QR code tickets
- Email confirmations

## 🔧 Development Setup

### Backend Development
```bash
cd revtickets-backend
mvn spring-boot:run
```

### Frontend Development
```bash
cd revtickets-frontend
npm install
npm start
```

## 🚀 Jenkins CI/CD Pipeline

### Setup Jenkins Pipeline
1. Install Jenkins
2. Create new Pipeline job
3. Use SCM: Git
4. Repository: https://github.com/Prem1116/RevTickets-P1.git
5. Script Path: Jenkinsfile

### Pipeline Stages
- ✅ Checkout code
- ✅ Build backend (Maven)
- ✅ Build frontend (npm)
- ✅ Run tests
- ✅ Docker build
- ✅ Deploy containers
- ✅ Health checks

## 📝 Environment Variables

Create `.env` file (optional):
```
MYSQL_ROOT_PASSWORD=Prem@1102
MYSQL_DATABASE=revtickets_db
MYSQL_USER=prem
MYSQL_PASSWORD=Prem@1102
```

## 🐳 Docker Commands

```bash
# Start all services
docker-compose up -d

# Stop all services
docker-compose down

# View logs
docker-compose logs

# Rebuild images
docker-compose build --no-cache
```

## 🔍 Troubleshooting

### Port Conflicts
If ports are already in use, modify `docker-compose.yml`:
```yaml
ports:
  - "4201:80"    # Frontend
  - "8082:8080"  # Backend
  - "3308:3306"  # MySQL
  - "27018:27017" # MongoDB
```

### Database Connection Issues
1. Wait for containers to fully start (30-60 seconds)
2. Check container logs: `docker-compose logs mysql`
3. Verify database credentials in `application.properties`

## 📚 API Documentation

### Authentication
- POST `/api/auth/login` - User login
- POST `/api/auth/register` - User registration

### Events
- GET `/api/events` - List all events
- GET `/api/events/{id}` - Get event details
- POST `/api/events` - Create event (Admin)

### Bookings
- POST `/api/bookings` - Create booking
- GET `/api/bookings/user/{userId}` - User bookings

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. Commit changes
4. Push to branch
5. Create Pull Request

## 📄 License

This project is licensed under the MIT License.

## 👥 Team

- **Developer:** Prem Radhakrishnan
- **Repository:** https://github.com/Prem1116/RevTickets-P1