# First stage: Build the Go binary
FROM golang:1.18 as builder

WORKDIR /app

COPY main.go .

RUN go mod init guestbook
RUN go mod tidy

RUN go build -o main main.go

# Second stage: Set up the final image
FROM ubuntu:18.04

# Copy the binary from the builder stage
COPY --from=builder /app/main /app/guestbook

# Copy static files into the final image
COPY public/index.html /app/public/index.html
COPY public/script.js /app/public/script.js
COPY public/style.css /app/public/style.css
COPY public/jquery.min.js /app/public/jquery.min.js

# Set the working directory
WORKDIR /app

# Set the default command for the container
CMD ["./guestbook"]
EXPOSE  3000
