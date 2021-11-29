## Zendesk Account : zcckarthikcorp.zendesk.com

# Setup

1. Install Docker.
2. In the `./app/.env` file add the API key under the name `API_KEY`. The key must belong to a user of this account.
Example:
```
API_KEY=<token>
```
3. Run the following command to build the project in docker.
```
docker build --tag zendesk .
```
4. Start the server using the below command.
```
docker run -p 3000:3000 zendesk
```
5. The application can be accessed at : `localhost:3000/`
