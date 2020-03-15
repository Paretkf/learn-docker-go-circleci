FROM golang:1.13.3-alpine as go-build

WORKDIR /go/src/app

COPY . .

RUN go mod download

RUN go build -o ./main ./main.go

FROM alpine:latest

COPY --from=go-build /go/src/app .

CMD ["./main"]

EXPOSE 8080
