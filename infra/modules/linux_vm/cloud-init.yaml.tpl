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

  - mkdir -p /opt/agritech

  - curl -L -o /opt/agritech/docker-compose.yaml https://raw.githubusercontent.com/bhavani-nagula/agritech-cicd/main/docker-compose/docker-compose.yaml

  - |
      cat > /opt/agritech/deploy.sh <<'EOF'
      #!/bin/bash

      docker login agritechdevacr.azurecr.io \
        -u ${acr_username} \
        -p ${acr_password}

      until docker pull agritechdevacr.azurecr.io/agritech-backend:latest
      do
        echo "Waiting for backend image..."
        sleep 20
      done

      until docker pull agritechdevacr.azurecr.io/agritech-frontend:latest
      do
        echo "Waiting for frontend image..."
        sleep 20
      done

      cd /opt/agritech

      docker-compose pull

      docker-compose up -d
      EOF

  - chmod +x /opt/agritech/deploy.sh

  - nohup /opt/agritech/deploy.sh >/var/log/deploy.log 2>&1 &