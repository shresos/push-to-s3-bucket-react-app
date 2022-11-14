FROM node:alpine AS build
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

FROM nginx:alpine AS Final
WORKDIR /app
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
