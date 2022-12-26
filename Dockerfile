FROM klakegg/hugo:0.101.0-ext-alpine-ci as build

COPY . /app
WORKDIR /app

RUN hugo build


FROM busybox:1.35

LABEL org.opencontainers.image.source="https://github.com/thomasstxyz/thomasst.xyz"

RUN adduser -D static
USER static
WORKDIR /home/static

COPY --from=build /app/public/ .

CMD ["busybox", "httpd", "-f", "-v", "-p", "3000"]