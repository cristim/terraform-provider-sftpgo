default: install

generate:
	tfplugindocs generate --provider-name sftpgo

build:
	go build -trimpath -ldflags "-s -w -X github.com/drakkan/terraform-provider-sftpgo/sftpgo.version=dev -X github.com/drakkan/terraform-provider-sftpgo/sftpgo.commit=`git describe --always --abbrev=8 --dirty`" -o terraform-provider-sftpgo

install:
	go install -trimpath -ldflags "-s -w -X github.com/drakkan/terraform-provider-sftpgo/sftpgo.version=dev -X github.com/drakkan/terraform-provider-sftpgo/sftpgo.commit=`git describe --always --abbrev=8 --dirty`" .

test:
	go test -v -count=1 -parallel=4 ./...

testacc:
	TF_ACC=1 go test -v -count=1 -parallel=4 -timeout 10m -v ./...
