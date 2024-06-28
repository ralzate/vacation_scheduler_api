# Vacation Scheduler API

This repository contains a Ruby on Rails API application for managing vacation schedules.

## Overview

This API provides endpoints to manage users and their vacations using JSON format. Authentication is handled via JWT tokens.

## Setup

### Prerequisites

- Ruby version 3.3.0
- Rails
- PostgreSQL database

### Installation

```bash
# Clone the repository
git clone https://github.com/your_username/vacation_scheduler_api.git
cd vacation_scheduler_api

# Install dependencies
bundle install

# Set up the database
rails db:create
rails db:migrate

# Start the Rails server
rails server 
```
The API server should now be running locally at http://localhost:3000.

## Endpoints
### Users
- POST /users: Create a new user.
- GET /users/:id: Get details of a user.

### Sessions
- POST /api/v1/login: Authenticate and generate JWT token.

### Vacations
- GET /api/v1/vacations: Get all vacations.
- POST /api/v1/vacations: Create a new vacation.
- GET /api/v1/vacations/:id: Get details of a vacation.
- PUT /api/v1/vacations/:id: Update a vacation.
- DELETE /api/v1/vacations/:id: Delete a vacation.

## Testing
RSpec is used for testing. Run the tests with:
```
bundle exec rspec
```