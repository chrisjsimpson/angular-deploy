FROM node:12.19.0 as node

WORKDIR /usr/src/app

COPY . .

RUN npm install

RUN npm run build --prod

FROM httpd:2.4.46-alpine

COPY --from=node /usr/src/app/dist/subscribie-angular/ /usr/local/apache2/htdocs/

