#!/bin/bash

set -e

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 [ecosystem|lognet|experimental] [client|server|both]"
    exit 1
fi

PROJECT="$1"
MODE="$2"

build_project() {
    echo "🔧 Building $PROJECT..."

    case "$PROJECT" in
        experimental)
            (cd spring-grpc/samples && ./gradlew grpc-server:build)
            ;;
    esac
}

start_server() {
    echo "🚀 Starting server..."
    case "$PROJECT" in
        ecosystem)
            (cd grpc-ecosystem/grpc-spring-boot-gradle-example-main/grpc-server && ./gradlew bootRun) &
            ;;
        lognet)
            (cd lognet-grpc-spring/grpc-spring-boot-starter/grpc-spring-boot-starter-demo && ../gradlew :grpc-spring-boot-starter-demo:bootRun) &
            ;;
        experimental)
            (cd spring-grpc/samples && ./gradlew :grpc-server:bootRun) &
            ;;
    esac
    SERVER_PID=$!
}

start_client() {
    echo "📨 Starting client..."
    case "$PROJECT" in
        ecosystem)
            (cd grpc-ecosystem/grpc-spring-boot-gradle-example-main/grpc-client && ./gradlew bootRun) &
            ;;
        lognet)
            (cd lognet-grpc-spring/grpc-spring-boot-starter/grpc-spring-boot-starter-demo && ../gradlew :grpc-spring-boot-starter-demo:bootRun) &
            ;;
        experimental)
            (cd spring-grpc/samples && ./gradlew :grpc-client:bootRun) &
            ;;
    esac
    CLIENT_PID=$!
}

build_project

case "$MODE" in
    server)
        start_server
        wait $SERVER_PID
        ;;
    client)
        start_client
        wait $CLIENT_PID
        ;;
    both)
        start_server
        sleep 3
        start_client
        wait $SERVER_PID $CLIENT_PID
        ;;
    *)
        echo "Unknown mode: $MODE"
        echo "Valid options: client, server, both"
        exit 1
        ;;
esac
