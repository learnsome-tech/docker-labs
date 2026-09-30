FROM golang:1.23-alpine AS build
WORKDIR /src
COPY main.go .
RUN CGO_ENABLED=0 go build -o /out/worker main.go

FROM gcr.io/distroless/static-debian12
COPY --from=build /out/worker /worker
USER nonroot
ENTRYPOINT ["/worker"]
