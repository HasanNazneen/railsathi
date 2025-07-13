RailSathiBE - Dockerized Django Project

Overview:

A basic Django REST API project containerized with Docker. This setup includes PostgreSQL integration, automatic migrations, and easy local development with environment variable support.

Setting Up: 

1.	Clone the repository
2.	git clone git clone https://github.com/s2pl/RailSathiBE.git
3.	cd RailSathiBE
4.  Create Virtual environment.
5.  Install dependencies
    pip install -r requirements.txt
6. Create required files like Dockerfile, docker-compose.yml, .env etc.
7.  Build and run conatiners 
    docker-compose up --build 
    docker-compose up
        or
    docker-compose up -d (in detached mode)
8.	Access the application
        Swagger UI: http://localhost:8000/swagger/
        Django Admin: http://localhost:8000/admin/
        items: http://127.0.0.1:8000/items/
7.	Create a superuser
    docker-compose exec web python manage.py createsuperuser
9.	Stop containers
    docker-compose down

Features : 

1.  Dockerized Django project with PostgreSQL database
2.  On running docker-compose up, the app is:
	•	Migrating the database.
	•	Is accessible at http://localhost:8000/items/.
4.  Added a wait-for-it.sh  to handle database startup timing.
5.  Added Django admin and created a superuser via Docker.
6.  Included Swagger.
7.  Added volumes for code hot-reloading in development mode- mounted my current directory  to /app in the container via the volume.

Tech Stack:

Django: The main backend web framework.
Django REST Framework: To build RESTful APIs.
PostgreSQL: As the relational database.
Docker: For containerizing both the Django app and the database.
Docker Compose: To orchestrate the multi-container application.
Swagger (via drf-yasg): To generate interactive API docume-dntation.
wait-for-it.sh: To handle database startup timing and ensure Django doesn’t start before the database is ready


Common Endpoints:

|Method  | Endpoint             | Description               |
|--------|----------------------|---------------------------|
| GET    | /items/              | List all items            |
| POST   | /items/              | Create a new item         |
| GET    | /items/{id}/         | Retrieve an item          |
| PUT    | /items/{id}/         | Update an item            |
| DELETE | /items/{id}/         | Delete an item            |

Assumptions and Limitations:

1. This setup assumes Docker Desktop or Docker Engine is installed and working.
2. The database user, password, and database name are hardcoded in docker-compose.yml and Django settings.
3. No user authentication or permissions implemented beyond Django admin.
4. PostgreSQL service is named db and reachable by Django via Docker Compose networking.
5. Swagger UI reflects only registered API endpoints