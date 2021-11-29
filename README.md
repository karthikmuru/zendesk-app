docker build --tag zendesk .
docker run -p 3000:3000 zendesk

# Setup

1. Install Docker.
2. In the ./app/.env file add the API key 