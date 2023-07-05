FROM node:20-alpine 

WORKDIR /app

COPY . .

RUN rm -rf node-app
RUN npm install

EXPOSE 3000

CMD ["node", "index.js"]
