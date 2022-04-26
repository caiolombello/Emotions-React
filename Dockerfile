FROM node:8 as build

WORKDIR /app/

COPY src /app/src/
COPY public /app/public/
COPY package* /app/

RUN npm install && npm run build

FROM nginx:stable

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

RUN [ "nginx" ]