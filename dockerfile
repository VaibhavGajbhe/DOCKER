FROM node:16.17.0-alpine AS conatiner-one 
#mini container (img1) one node is the packeage and alpine is the OS 
  
WORKDIR /todoapp
# WORKDIR create the directory and cd into the folder
COPY . /todoapp/
# COPY is copy the file into destination folder

RUN npm install
RUN npm run build

FROM nginx:stable-alpine AS container-two
#mini container (img2) one node is the packeage and alpine is the OS 
RUN rm -rf /usr/share/nginx/html/*
COPY --from=conatiner-one /todoapp/build/ /usr/share/nginx/html