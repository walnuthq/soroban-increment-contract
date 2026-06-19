default: build

all: test

test: build
	cargo test

build:
	stellar contract build --verifiable --image docker.io/stellar/stellar-cli@sha256:c1297d0c2c6790dda6afaa3edd39a959ec12edd6ebe30282dd1d7a663e7c4109
	@ls -l target/wasm32v1-none/release/*.wasm

deploy:
	stellar contract deploy \
 		--wasm target/wasm32v1-none/release/soroban_increment_contract.wasm \
  	--source-account alice \
  	--network testnet \
  	--alias soroban_increment_contract

fmt:
	cargo fmt --all

clean:
	cargo clean
