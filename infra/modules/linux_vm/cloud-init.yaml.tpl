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

  # Login to Azure Container Registry
  - docker login agritechdevacr.azurecr.io -u ${acr_username} -p ${acr_password}

  # Create application directory
  - mkdir -p /opt/agritech

  # Download latest docker-compose file
  - curl -L -o /opt/agritech/docker-compose.yaml https://raw.githubusercontent.com/bhavani-nagula/agritech-cicd/main/docker-compose/docker-compose.yaml

  # Pull latest images from ACR
  - bash -c "cd /opt/agritech && docker-compose pull"

  # Start containers
  - bash -c "cd /opt/agritech && docker-compose up -d"