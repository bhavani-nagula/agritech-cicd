#cloud-config

package_update: true
package_upgrade: true

packages:
  - docker.io
  - docker-compose
  - curl
  - unzip

runcmd:

 - systemctl enable docker

 - systemctl start docker

 - sleep 30

 - docker login agritechdevacr.azurecr.io -u agritechdevacr -p <ACR_PASSWORD>

 - mkdir -p /opt/agritech

 - curl -o /opt/agritech/docker-compose.yaml https://raw.githubusercontent.com/bhavani-nagula/agritech-cicd/main/docker-compose/docker-compose.yaml

 - cd /opt/agritech

 - docker-compose pull

 - docker-compose up -d