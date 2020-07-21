# SMSsenger API

This is the back-end application needed to interact with the [SMSsenger APP](https://github.com/Tr1ckC0/SMSsenger-frontend). Follow these installation instructions before attempting to start the front-end app.

## Features

- Uses the Plivo Messaging API to send an SMS to any phone number around the world
- Uses the Plivo Messaging API combined with Action Cable to receive SMS and display the message on the front end
- Produces a historical log of all messages sent or received within a time period by querying the Plivo API

## Technology

- Plivo Messaging API
- Rails
- Action Cable Web Sockets
- Ngrok

## Installation & Deployment

1. Install [Rails](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails).
2. Follow the instructions to set up a [Plivo Account](https://console.plivo.com/accounts/register/).
3. Install [Ngrok](https://ngrok.com/download)
4. Clone this repository, navigate to its directory.
5. Run ```bundle install``` followed by ```rails db:create``` & ```rails db:migrate```
6. Run this in your terminal to create a .env file.
```
echo "RACK_ENV=development" >> .env
echo "PORT=3000" >> .env
echo "AUTH_ID=<your Plivo ID>" >> .env
echo "AUTH_TOKEN=<your Plivo token>" >> .env
echo "PHONE_NUMBER=<your Plivo Number>" >> .env
```
7. Navigate to your [Plivo Console](https://console.plivo.com/dashboard/) and copy the AUTH_ID and AUTH_TOKEN from the homepage and paste them as the value of the respective variables in the .env file.
8. Follow the instructions here to buy a [Plivo Phone Number](https://www.plivo.com/docs/sms/quickstart/ruby#send-your-first-outbound-sms) and paste in in the .env file.
9. Start a Ngrok Server ```./ngrok http 3000``` and follow the instructions [here](https://www.plivo.com/docs/sms/quickstart/ruby#reply-to-an-incoming-sms) to create a new application. Associate it with your Plivo number and the paste ```<your ngrok URL>/receive``` in the Message URL field. (Or if you're a Plivo Team member search for *SMSsenger* under the list of applications and add the URL to that application)
10. Run ```rails s``` and navigate to [localhost:3000](http://localhost:3000/) to confirm your server is running.
11. Follow [these instructions](https://github.com/Tr1ckC0/SMSsenger-frontend) to deploy the front end.
