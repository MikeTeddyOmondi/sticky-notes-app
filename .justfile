# Default
default:
  just --list

# Build Docker Image
build-image:
  docker build -t sticky-notes-app:v2.0.0 . 

# Create docker network
create-net:
  docker network create sticky-notes
  
# Run Docker Container
run-container:
  docker run -d -p 4120:3000 --network sticky-notes --restart always --name sticky-notes-local sticky-notes-app:v2.0.0  

# Dispose container  
dispose-container:
  docker stop sticky-notes-local
  docker rm sticky-notes-local

# Docker compose up (detached)
compose:
  docker compose up -d

# Docker compose down
compose-down:
  docker compose down

# Tear down container plus volumes
tear-down:
  docker compose down -v

# Tag docker image
tag:
  docker tag sticky-notes-app:v2.0.0 ranckosolutionsinc/sticky-notes-app:v2.0.0

# Push to Docker Hub
push:
  docker push ranckosolutionsinc/sticky-notes-app:v2.0.0


