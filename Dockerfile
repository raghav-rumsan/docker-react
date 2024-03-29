# Working in production enviromnent
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build


FROM nginx
EXPOSE 80
# copy from different stage/phase
COPY --from=builder /app/build /usr/share/nginx/html