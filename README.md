# Secure JWT A Laravel Project

This project is a Laravel-based web application, containerized with Docker, running PHP 8.2 and MySQL. The project is pre-configured with JWT authentication using the `tymon/jwt-auth` package for secure token-based user authentication.

## Prerequisites

Ensure the following are installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Initial Setup

Follow the steps below to set up and run the application locally for the first time:

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Build the Docker Containers
Build and start the Docker containers:

```bash
docker-compose up -d --build
```

**This command will:**
 - Build the PHP 8.2 FPM image with necessary extensions.
 - Create a MySQL database container.
 - Set up the Laravel application with Composer dependencies, including `tymon/jwt-auth`.

### 3. Generate Laravel Application Key
To secure your application, generate the Laravel application key:

``` bash
docker-compose run --rm app php artisan key:generate
```

### 4. Set up JWT Authentication
Generate a JWT secret key by running:

```bash
docker-compose run --rm app php artisan jwt:secret
```

This will generate a new secret key for JWT authentication and update your `.env` file with the `JWT_SECRET`.

## How to Run the Application
Once the containers are up and running, you can access the application by visiting:

- [http://localhost:9000](http://localhost:9000)

To check if everything is working properly, ensure that:

- The Laravel welcome page is visible.
- The database is accessible.

## Additional Commands
- Stop the containers: `docker-compose down`

- Rebuild the containers (e.g., after changes to Dockerfile): `docker-compose up -d --build`

- Run Artisan commands:

  ```bash
  docker-compose run --rm app php artisan <command>
  ```

### Additional Configuration
- Database: The project is set up to use a MySQL 8.0 database. Default credentials are:

  - Database name: laravel
  - Username: laravel
  - Password: password
  - Root password: root

- You can change these in the docker-compose.yml file or the .env file inside the Laravel project.

### Troubleshooting
- If you encounter issues, ensure that:

- Docker and Docker Compose are properly installed and running.
- The ports 9000 (for PHP-FPM) and 3306 (for MySQL) are not being used by other processes.

## Contributions

This repository is primarily for personal use, but contributions are welcome. If you have suggestions or improvements, feel free to fork the repository and submit a pull request.


## License

This project is licensed under the MIT License - see the [LICENSE](https://opensource.org/license/mit) file for details.

**Happy Coding!**
