# Goal of this project

This is a sample Node.js web app using the Express framework and EJS templates.

The goal here is to deploy this application in various ways like docker, kubernetes. For this we'll use major DevOps tools and techniques.
We'll also create a CICD pipeline to automate our builds and deployments.
Later, we'll be implementing devops and production best practise to make our application production ready.


## Screens

![screen](https://user-images.githubusercontent.com/14982936/55620043-dfe96480-5791-11e9-9746-3b42a3a41e5f.png)
![screen](https://user-images.githubusercontent.com/14982936/55620045-dfe96480-5791-11e9-94f3-6d788ed447c1.png)
![screen](https://user-images.githubusercontent.com/14982936/58764072-d8102b80-855a-11e9-993f-21ef0344d5e0.png)

# 🧑‍💻 Running and Testing Locally
## Pre-reqs
* Nodejs
* Docker
* Docker Compose
* Kubernetes


## Running Locally
Navigate to nodejs-demoapp/src/ in the terminal

Run the command in terminal
$ npm ci
$ npm start

<img width="1591" height="792" alt="image" src="https://github.com/user-attachments/assets/a0f56ce1-1cdf-4143-962d-75b838dceac7" />


Now, the app is available to access on localhost:3000 (by default)

## Running Docker container
Build image of the application based on the existing Dockerfile 
$ docker build -t nodejs-demoapp-image .
then,
$ docker images
$ docker run -d --name nodejs-demoapp -p 3000:3000 nodejs-demoapp-image
$ docker ps
$ docker logs <container-id>

Again, access the application on localhost:3000

<img width="1533" height="789" alt="image" src="https://github.com/user-attachments/assets/c04b9277-4e29-4b3e-a7ab-9668456d61d3" />
<img width="1530" height="774" alt="image" src="https://github.com/user-attachments/assets/40e75701-fb81-45e6-8fab-9efdb8aab682" />
<img width="1578" height="800" alt="image" src="https://github.com/user-attachments/assets/bacd2d2a-5122-4015-b9b4-b9697a7b710a" />

