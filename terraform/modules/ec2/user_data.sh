#!/bin/bash
sudo apt update
sudo apt install -y docker.io
sudo usermod -a -G docker ubuntu
sudo -u ubuntu docker network create wp-network
sudo -u ubuntu mkdir /home/ubuntu/actions-runner && cd /home/ubuntu/actions-runner
sudo -u ubuntu curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz
sudo -u ubuntu echo "0dbc9bf5a58620fc52cb6cc0448abcca964a8d74b5f39773b7afcad9ab691e19  actions-runner-linux-x64-2.323.0.tar.gz" | shasum -a 256 -c
sudo -u ubuntu tar xzf ./actions-runner-linux-x64-2.323.0.tar.gz
sudo -u ubuntu ./config.sh --url ${github_url} --token ${github_token} --name "runner-$(hostname)"  --work "_work" --labels "linux"  --unattended  --replace
sudo ./svc.sh install
sudo ./svc.sh start