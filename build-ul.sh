GO111MODULE=on CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags kqueue -trimpath --ldflags "$(go run buildscripts/gen-ldflags.go)" -o $(PWD)/minio 1>/dev/null
docker buildx build --push --build-arg RELEASE="$(git describe --abbrev=0 --tags)" -t "gcr.io/univers-labs/minio:latest" -f Dockerfile.release --platform=linux/amd64 .
kubectl delete pods --all -n minio