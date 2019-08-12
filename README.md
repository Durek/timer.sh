# timer.sh

## Usage:
```timer.sh "directory to run in" "command" "session name" minDuration maxDuration chance```
1. Directory to run in
2. The command to be executed
3. The name of the screen session in which the command will run
4. Minimum time in seconds to wait before stopping
5. Maximum time in seconds to wait before stopping
6. Chance of execution, number from 1 to 10, 1 means always and 10 means on roughly every 10th run

 Every option is obligatory, there are no checks which means it won't work the way you expect without everything set.
 It's recommended to execute the command inside of a screen session, like this

```screen -dmS CoolSession.timer bash /home/user/.lib/timer.sh "/home/user/coolapp/" "node index.js" "CoolSession" 7200 28800 3```

## Alternative usage:
1. Set options in timer.sh
2. ????
3. Profit
