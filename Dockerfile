FROM node:16-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN yarn build
# the resulting build will be in /app/build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# nginx will start automatically