## Running Docker container

Build image of the application based on the existing Dockerfile
$ docker build -t nodejs-demoapp-image .
then,
$ docker images
$ docker run -d --name nodejs-demoapp -p 3000:3000 nodejs-demoapp-image
$ docker ps
$ docker logs `<container-id>`

Again, access the application on localhost:3000

<img width="1533" height="789" alt="image" src="https://github.com/user-attachments/assets/c04b9277-4e29-4b3e-a7ab-9668456d61d3" />
<img width="1530" height="774" alt="image" src="https://github.com/user-attachments/assets/40e75701-fb81-45e6-8fab-9efdb8aab682" />
<img width="1578" height="800" alt="image" src="https://github.com/user-attachments/assets/bacd2d2a-5122-4015-b9b4-b9697a7b710a" />
