FROM golang:1.17.2 AS builder

ADD . /test-controller
WORKDIR /test-controller

RUN CGO_ENABLED=0 go build -o /output/test-controller  -v .

FROM scratch

COPY --from=builder /output/test-controller /

ENTRYPOINT ["./test-controller"]