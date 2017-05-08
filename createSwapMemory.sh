# Create SWAP memory
echo "Creating SWAP memory..."
sudo fallocate -l 1G /meteordeployswapfile
sudo chmod 600 /meteordeployswapfile
sudo mkswap /meteordeployswapfile
sudo swapon /meteordeployswapfile
sudo swapon --show
