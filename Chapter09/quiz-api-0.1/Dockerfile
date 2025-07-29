FROM golang:1.19-alpine AS build-stage
WORKDIR /app
COPY /app/go.mod /app/go.sum ./
RUN go mod download

COPY /app/*.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /quiz-api

FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /

COPY --from=build-stage /quiz-api /quiz-api

EXPOSE 8080

USER nonroot:nonroot
ENTRYPOINT ["/quiz-api"]
