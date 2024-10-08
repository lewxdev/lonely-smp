#!/bin/bash

TIME_TO_START=15 # seconds
RAM_FOR_SYSTEM=2048 # 2 GiB

trap 'echo; echo "exiting gracefully..."; exit 1' INT

while true; do
  RAM_USAGE=$(($(free -m | awk '/^Mem:/{print $2}') - RAM_FOR_SYSTEM))
  HR_RAM_USAGE=$(awk "BEGIN {printf \"%.1f\", $RAM_USAGE/1000}")
  echo
  echo "allocating ${HR_RAM_USAGE}GiB RAM to the server"
  echo "updating server.properties"
  sed -i -E "s/(motd=.*)([0-9]+\.[0-9]+) GB/\1$HR_RAM_USAGE GB/" server.properties
  java -Xmx${RAM_USAGE}M -Xms${RAM_USAGE}M -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1HeapRegionSize=8M -XX:G1HeapWastePercent=5 -XX:G1MaxNewSizePercent=40 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1NewSizePercent=30 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -XX:MaxGCPauseMillis=200 -XX:MaxTenuringThreshold=1 -XX:SurvivorRatio=32 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar --nogui

  echo
  echo "server stopped, restarting in ${TIME_TO_START}s"
  echo "press 'ctrl + c' at any time to abort"

  for (( i = TIME_TO_START; i >= 1; i-- )); do
    echo -ne "server restarting in ${i}s...\033[0K\r"
    sleep 1
  done
done
