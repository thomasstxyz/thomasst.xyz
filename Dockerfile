FROM klakegg/hugo:0.101.0-ext-alpine-ci as build

COPY . /app
WORKDIR /app

RUN hugo build


FROM sebp/lighttpd

EXPOSE 80

RUN rm -rf /var/www/localhost/htdocs/*

COPY --from=build /app/public/ /var/www/localhost/htdocs
