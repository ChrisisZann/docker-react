# Phase1: Build
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Phase2: Run
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html