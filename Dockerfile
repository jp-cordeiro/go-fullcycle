FROM golang:alpine3.18 as builder

WORKDIR /app
COPY . .
RUN go build -o /full-cycle full-cycle.go

FROM scratch

WORKDIR /
COPY --from=builder /full-cycle /full-cycle

ENTRYPOINT [ "/full-cycle" ]