FROM nginx:latest AS builder
WORKDIR /usr/share/nginx/html/
COPY dist/ ./
#RUN yarn
#CMD yarn build
#CMD yarn dev
#EXPOSE 3000

