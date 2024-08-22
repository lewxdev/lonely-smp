# Lonely SMP

this is the complete configuration history of my personal minecraft server. currently running on a [**Raspberry Pi 5 (8GB)**](https://www.raspberrypi.com/products/raspberry-pi-5/).

## Setup

these are the steps I followed to get the server up and running.

1. follow the [PaperMC Docs on Installing or Updating Java](https://docs.papermc.io/misc/java-install#ubuntudebian)

   ```bash
   # install prerequisite dependencies
   sudo apt update && sudo apt upgrade
   sudo apt install ca-certificates apt-transport-https gnupg wget

   # get the amazon corretto public key and apt repository
   wget -O - https://apt.corretto.aws/corretto.key | sudo gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
   echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | sudo tee /etc/apt/sources.list.d/corretto.list

   # install java and other dependencies
   sudo apt update
   sudo apt install java-21-amazon-corretto-jdk libxi6 libxtst6 libxrender1
   ```

1. [verify the installation](https://docs.papermc.io/misc/java-install#verifying-installation)

   ```bash
   java -version
   ```

1. download the latest build from purpur

   ```bash
   curl -o server.jar https://api.purpurmc.org/v2/purpur/1.21.1/latest/download
   ```

1. follow the [Minecraft server optimization guide](https://github.com/YouHaveTrouble/minecraft-optimization/blob/1.21/README.md)

1. start the server in a new tmux session

   ```bash
   tmux new -Ads lonely-smp
   ```

1. run the server

   ```bash
   bash run.sh
   ```
