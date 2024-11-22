# Dua Page Server

This project serves as the backend for the Dua Page application. It is built using **Express.js**, **Prisma**, and **TypeScript**, with a focus on managing and serving Islamic duas (supplications) and their categories.

## Features
- RESTful API endpoints to manage categories and duas.
- **Prisma ORM** for database interaction.
- **SQLite** as the default database.
- TypeScript for a strongly-typed development experience.
- Dockerized for easy deployment.

## Prerequisites
Before running the project, ensure you have the following installed on your system:
- **Node.js** (v18+ recommended)
- **npm** or **yarn**
- **Docker** (optional, for running the Docker image)

## Installation

1. Docker Image:
   ```bash
   docker pull lbtoha/dua-page-server:latest
   ```

##  Endpoints

- `/api/v1/categories` - Get all categories.
- `/api/v1/duas?cat={category_id}` - Get all duas in a category.