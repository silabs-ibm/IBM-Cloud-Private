FROM node:alpine
WORKDIR /app

COPY package.json /app/package.json
RUN npm install --production

COPY index.js /app/index.js
EXPOSE 80

CMD npm start