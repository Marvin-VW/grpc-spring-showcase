# gRPC Spring Boot Showcase 🚀

This project compares three popular Spring Boot + gRPC integrations:

- [`grpc-ecosystem/grpc-spring`](https://github.com/grpc-ecosystem/grpc-spring)
- [`LogNet/grpc-spring-boot-starter`](https://github.com/LogNet/grpc-spring-boot-starter)
- [`spring-projects/spring-grpc`](https://github.com/spring-projects/spring-grpc)

## 📦 Setup

```bash
# Clone the repo + initialize submodules
git clone https://github.com/marvin-vw/grpc-spring-showcase.git
cd grpc-spring-showcase
git submodule update --init --recursive
```

## ▶️ Running
```bash
./run.sh [ecosystem|lognet|springup] [client|server|both]
Examples:
./run.sh ecosystem both
./run.sh lognet client
./run.sh springup server
```

## 🛠 Notes
* You need Java 17+ and Gradle (Wrapper included).
* Each demo starts with `bootRun` through Gradle.
* `both` starts the server and client in parallel.

**Experimental Setup:**

These integrations are still experimental. You can test them using `grpcurl`:

```bash
grpcurl -d '{"name":"Hi"}' -plaintext localhost:9090 Simple.SayHello
```

To stop the server, use:

```bash
pkill -f 'java.*grpc'
```