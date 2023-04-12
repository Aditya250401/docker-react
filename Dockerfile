

#we need to specify the image as builder
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#everything created in the above phase will be copied in '/app/build' folder
#now we need to specify the image as runner
#when we specify the new from it understands to finish the prev phase
#and start the new phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#we have to state the image from which we have to copy the file
#and the folder
#and the destination
#nginix will start automatically when run the container
#e aisehi extra comment karna padta hai