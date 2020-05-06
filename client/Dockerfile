FROM node:alpine as builder
WORKDIR '/app'
COPY . .
RUN npm install
CMD npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/sahre/nginx/html