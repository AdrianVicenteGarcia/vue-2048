FROM node:latest AS builder
WORKDIR /opt/vue
COPY . ./
RUN yarn
RUN yarn build



FROM nginx:latest AS runtime
WORKDIR /usr/share/nginx/html/
COPY --from=builder /opt/vue/dist/ ./


#RUN yarn
#CMD yarn build
#CMD yarn dev
#EXPOSE 3000

