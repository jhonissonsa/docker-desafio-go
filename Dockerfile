FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o desafio_go main.go

FROM scratch

COPY --from=builder /usr/src/app/desafio_go /desafio_go

ENTRYPOINT ["/desafio_go"]
