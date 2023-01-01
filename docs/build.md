# Build

Don't use this, use a modern tool

docker build -t memogarcia10/modern-dev:latest .

docker run -p 0.0.0.0:5000:80 memogarcia10/modern-dev:latest

docker run -it memogarcia10/modern-dev:latest bash


docker buildx build --platform linux/amd64 --push -t memogarcia10/modern-dev:amd --push .

docker push memogarcia10/modern-dev:amd