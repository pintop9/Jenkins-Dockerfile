cat << 'EOF' > install_docker.sh
#!/bin/bash

# Check if Docker is installed
if command -v docker &> /dev/null
then
    echo "Docker is already installed."
    docker --version
else
    echo "Docker is not installed. Installing Docker..."
    
    # Update the apt package index
    sudo apt-get update
    
    # Install packages to allow apt to use a repository over HTTPS
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Add Docker's official GPG key -  A GPG key verifies the authenticity of a software package."
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Set up the stable repository
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update the apt package index (again)
    sudo apt-get update

    # Install Docker Engine
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Verify that Docker Engine is installed correctly
    sudo docker run hello-world

    echo "Docker has been successfully installed."
    docker --version
fi
EOF

# Make the script executable
chmod +x install_docker.sh

# Run the script
sudo ./install_docker.sh