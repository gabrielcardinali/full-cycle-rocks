FROM golang AS build-stage

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /full-cycle-rocks

EXPOSE 8000

CMD ["/full-cycle-rocks"]