#cloud-config

package_update: true
package_upgrade: true

packages:
  - docker.io
  - docker-compose
  - git
  - curl
  - unzip




runcmd:

 - systemctl enable docker

 - systemctl start docker

 - sleep 30

 - git clone https://github.com/bhavani-nagula/docker-frontend-code.git /opt/agritech

 - bash -c 'cd /opt/agritech/docker-compose && docker-compose up -d --build'

  