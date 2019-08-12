#!/bin/bash

#
# Usage: timer.sh "directory to run in" "command" "session name" minDuration maxDuration chance
#	1. Directory to run in
#	2. The command to be executed
#	3. The name of the screen session in which the command will run
#	4. Minimum time in seconds to wait before stopping
#	5. Maximum time in seconds to wait before stopping
#	6. Chance of execution, number from 1 to 10, 1 means always and 10 means on roughly every 10th run
#
# Every option is obligatory, there are no checks which means it won't work the way you expect without everything set.
# It's recommended to execute the command inside of a screen session, like this
#	screen -dmS CoolSession.timer bash /home/user/.lib/timer.sh "/home/user/coolapp/" "node index.js" "CoolSession" 7200 28800 3
# 
# Alternative usage: timer.sh
#	1. Set options below
#	2. ????
#	3. Profit
#

# Directory to run in
_dir=$1
# The command to be executed
_cmd=$2
# The name of the screen session in which the command will run
_screenName=$3
# Minimum time in seconds to wait before stopping
_minDuration=$4
# Maximum time in seconds to wait before stopping
_maxDuration=$5
# Chance of execution, number from 1 to 10, 1 means always and 10 means on roughly every 10th run
_chance=$6

# Catch Ctrl+C
trap stopCmd SIGINT

# Stop function
function stopCmd {
	echo "Good morning, Sir! I've decided to quit."
	screen -S $_screenName -X quit
	exit 0
}

# Should we really run right now? Let's roll the dice and find out!
_random=`shuf -i 1-10 -n 1`
if [[ $_random -lt $_chance ]]; then
	echo "Uugh, better luck next time!"
	exit 0
fi

# We are allowed to run! Let's do it boiiis!
echo "We obey to your command, master!"
cd "$_dir"
screen -dmS $_screenName $_cmd

# We got some waiting to do boys
_random=`shuf -i $_minDuration-$_maxDuration -n 1`
echo "Sleeping for $_random seconds.."
sleep $_random

# Stop
stopCmd
