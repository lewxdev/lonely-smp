# Lonely SMP

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
