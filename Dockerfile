FROM node:alpine as Build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# /app/build <--- all the stuff

FROM nginx
COPY --from=Build /app/build /usr/share/nginx/html


