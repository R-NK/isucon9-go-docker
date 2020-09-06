export GO111MODULE=on

all: bin/benchmarker bin/benchmark-worker bin/payment bin/shipment

bin/benchmarker: cmd/bench/main.go bench/**/*.go
	go build -o bin/benchmarker cmd/bench/main.go

bin/benchmark-worker: cmd/bench-worker/main.go
	go build -o bin/benchmark-worker cmd/bench-worker/main.go

bin/payment: cmd/payment/main.go bench/server/*.go
	go build -o bin/payment cmd/payment/main.go

bin/shipment: cmd/shipment/main.go bench/server/*.go
	go build -o bin/shipment cmd/shipment/main.go

vet:
	go vet ./...

errcheck:
	errcheck ./...

staticcheck:
	staticcheck -checks="all,-ST1000" ./...

clean:
	rm -rf bin/*

download-images:
	cd webapp/public && \
	wget https://github.com/isucon/isucon9-qualify/releases/download/v2/initial.zip && \
	unzip initial.zip && \
	mv v3_initial_data upload

download-bench:
	cd initial-data && \
	wget https://github.com/isucon/isucon9-qualify/releases/download/v2/bench1.zip && \
	unzip bench1.zip && \
	mv v3_bench1 images