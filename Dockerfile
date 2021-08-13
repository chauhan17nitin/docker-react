FROM node:16-alpine

WORKDIR /app

COPY package.json .
RUN npm install
# RUN chown -R node: /app

COPY . .

RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
