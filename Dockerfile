FROM node:16-alpine as buidler
WORKDIR /home/node/app
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build 

FROM nginx
COPY --from=buidler /home/node/app/build /usr/share/nginx/html