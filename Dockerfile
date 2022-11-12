FROM klakegg/hugo:0.101.0-ext-alpine-ci as build

COPY . /app
WORKDIR /app

RUN hugo build


FROM nginx:alpine

EXPOSE 80

COPY --from=build /app/public/ /usr/share/nginx/html
