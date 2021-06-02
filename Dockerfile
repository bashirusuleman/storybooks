FROM node:14-slim   # higher versions of node failed in building the image. the app  only works with version 14

WORKDIR /usr/src/app

COPY ./package*.json ./

RUN npm install

COPY . . 

USER node

EXPOSE 3000

CMD ["npm", "start"]
