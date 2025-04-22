# gRPC Spring Boot Showcase 🚀

Dieses Projekt vergleicht drei beliebte Spring Boot + gRPC Integrationen:

- [`grpc-ecosystem/grpc-spring`](https://github.com/grpc-ecosystem/grpc-spring)
- [`LogNet/grpc-spring-boot-starter`](https://github.com/LogNet/grpc-spring-boot-starter)
- [`spring-projects/spring-grpc`](https://github.com/spring-projects/spring-grpc)

## 📦 Setup

```bash
# Repo clonen + Submodule initialisieren
git clone https://github.com/dein-username/grpc-spring-showcase.git
cd grpc-spring-showcase
git submodule update --init --recursive
```

## ▶️ Ausführen
```bash
./run.sh [ecosystem|lognet|springup] [client|server|both]
Beispiele:
./run.sh ecosystem both
./run.sh lognet client
./run.sh springup server
```
## 🛠 Hinweise
* Du brauchst Java 17+ und Gradle (Wrapper enthalten).
* Die einzelnen Demos starten jeweils mit bootRun über Gradle.
	•	both startet Server und Client parallel.