FROM klakegg/hugo:0.101.0-ext-alpine-ci as build

RUN hugo build


FROM nginx

COPY --from=build public/ /var/www/html
