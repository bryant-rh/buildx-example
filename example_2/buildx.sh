docker buildx build --platform linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t bryantrh/hello-go --push -f ./Dockerfile .
