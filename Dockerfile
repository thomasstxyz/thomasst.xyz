FROM klakegg/hugo:0.101.0-ext-alpine-ci as build

COPY . /app
WORKDIR /app

RUN hugo build


FROM nginx

EXPOSE 80

COPY --from=build /app/public/ /usr/share/nginx/html/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
