#!/bin/bash

# Update system and install Bitcoin
apt-get update
apt-get install -y wget

# Download Bitcoin Core
wget https://bitcoincore.org/bin/bitcoin-core-25.0/bitcoin-25.0-x86_64-linux-gnu.tar.gz

# Extract and install
tar -xzf bitcoin-25.0-x86_64-linux-gnu.tar.gz
cp bitcoin-25.0/bin/* /usr/local/bin/

# Create Bitcoin configuration
mkdir -p /root/.bitcoin
cat > /root/.bitcoin/bitcoin.conf << EOF
regtest=1
server=1
rpcuser=user
rpcpassword=pass
rpcallowip=0.0.0.0/0
fallbackfee=0.00001
txindex=1
EOF

echo "✅ Bitcoin installed successfully!"
echo "🚀 Your test environment is ready!"
