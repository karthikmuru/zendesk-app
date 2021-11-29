## Zendesk Account : zcckarthikcorp.zendesk.com

Framework : Ruby on Rails

## Setup

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

Important changes : 
```
app/app/controllers/tickets_controller.rb
app/app/controllers/application_controller.rb
```

## Sample output
Ticket List
![alt text](https://github.com/karthikmuru/zendesk-app/blob/main/sample_output/ticket-list.png)
Ticket Show
![alt text](https://github.com/karthikmuru/zendesk-app/blob/main/sample_output/ticket-show.png)
Error
![alt text](https://github.com/karthikmuru/zendesk-app/blob/main/sample_output/ticket-error.png)

