FROM    ubuntu:22.04

# installing docker
RUN     apt-get -y update
RUN     apt-get -y install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

RUN     mkdir -p /etc/apt/keyrings
RUN     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

RUN     echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN     apt-get -y update
RUN     apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin


# installing other dependencies
RUN     apt-get install conntrack

CMD     tail -F /dev/null