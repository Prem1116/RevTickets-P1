FROM eclipse-temurin:17-jdk

RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g @angular/cli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY revtickets-frontend/package*.json ./frontend/
WORKDIR /app/frontend
RUN npm install --legacy-peer-deps

WORKDIR /app
COPY revtickets-frontend/ ./frontend/
COPY revtickets-backend/target/*.jar ./app.jar

EXPOSE 4200 8080

CMD cd /app/frontend && ng serve --host 0.0.0.0 --port 4200 --disable-host-check & java -jar /app/app.jar