# Lonely SMP

This is the configuration history of my personal Minecraft server. Currently running on a [**Raspberry Pi 5 (8GB)**](https://www.raspberrypi.com/products/raspberry-pi-5/), but wanting to explore distributed computing in the future.

Feel free to use this as a general guide if you want to do something similar. But consider this repo as-is.

## Mods

### Datapacks

- [MasterCutter](https://modrinth.com/datapack/mastercutter) by [Nico4play](https://modrinth.com/user/Nico4play)

  The stonecutter is now more useful than ever with 500+ new recipes including woodcutting, enhanced base stonecutting, recycling and "un-crafting".

- [Miner's Delight!](https://modrinth.com/datapack/miners-delight!) by [Galeboy](https://modrinth.com/user/Galeboy)

  Makes mining more efficient, fun, and semi-automatable!

- [TreeCapitator](https://modrinth.com/datapack/treecapitator-datapack) by [HielkeMaps](https://modrinth.com/user/HielkeMaps)

  Chop down trees by breaking one block!

- [Veinminer](https://modrinth.com/datapack/veinminer) by [Miraculixx](https://modrinth.com/user/Miraculixx)

  Mine the whole vine on mining a single ore. Known feature by modpacks and pvp games like UHC (quick mine)

### Plugins

- [Advanced Backups](https://modrinth.com/plugin/advanced-backups) by [MommyHeather](https://modrinth.com/user/MommyHeather)

  The backup mod to solve all your problems - actively maintained for almost any minecraft version!

- [BlueMap](https://modrinth.com/plugin/bluemap) by [BlueColored](https://modrinth.com/user/BlueColored)

  A Minecraft mapping tool that creates 3D models of your Minecraft worlds and displays them in a web viewer.

- [DiscordSRV](https://modrinth.com/plugin/discordsrv) by [Scarsz](https://modrinth.com/user/Scarsz)

  The most powerful, configurable, open-source Discord to Minecraft bridging plugin available.

## Setup

These are the steps I followed to get the server up and running.

1. Follow the [PaperMC Docs on Installing or Updating Java](https://docs.papermc.io/misc/java-install#ubuntudebian)

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

1. [Verify the installation](https://docs.papermc.io/misc/java-install#verifying-installation)

   ```bash
   java -version
   ```

1. Download the latest build from Purpur

   ```bash
   curl -o server.jar https://api.purpurmc.org/v2/purpur/1.21.1/latest/download
   ```

1. Follow the [Minecraft server optimization guide](https://github.com/YouHaveTrouble/minecraft-optimization/blob/1.21/README.md)

1. Install additional dependencies for admin ergonomics (optional)

   ```bash
   sudo apt update
   sudo apt install git tmux
   ```

## Usage

1. Start the server in a new tmux session

   ```bash
   tmux new -As lonely-smp
   ```

1. Run the server

   ```bash
   bash run.sh
   ```

> [!TIP]
> After running the server script, you can use <kbd>Ctrl</kbd> + <kbd>B</kbd>, <kbd>D</kbd> to detach the tmux session. To reattach, use
> ```bash
> tmux attach -t lonely-smp
> ```
