FROM node:alpine as builder 
#build phase
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#prod phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
