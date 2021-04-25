#!/bin/bash

function clone_repos() {
    [ ! -d server ] && git clone https://github.com/InformatiCup/InformatiCup2021 server
    [ ! -d jumpstart ] && git clone https://github.com/TeamJumpstart/InformatiCup2021 jumpstart
    [ ! -d lehnurr ] && git clone https://github.com/Lehnurr/spe-ed-solver lehnurr
    [ ! -d brot ] && git clone https://github.com/TeamBrot/client brot
    [ ! -d speedos ] && git clone https://github.com/jubra97/speedos speedos
    [ ! -d chillow ] && git clone https://github.com/jonashellmann/informaticup21-team-chillow chillow
}

clone_repos


cat << EOF > server/spe_ed/Dockerfile
FROM golang:1.16

WORKDIR /go/src/app

COPY . .
RUN go build .

CMD [ "./server" ]
EOF

mkdir -p data/server/
cat << EOF > data/server/keys
jumpstart
lehnurr
brot
speedos
chillow
EOF

docker-compose up

