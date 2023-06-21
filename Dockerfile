FROM golang:1.20.5 AS builder

WORKDIR /app

COPY . .

RUN go build -o main .

FROM scratch

COPY --from=builder /app/main /

CMD ["/main"]