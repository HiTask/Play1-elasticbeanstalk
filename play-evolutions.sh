#!/bin/sh
# Play Evolutions command run during Elastic Beanstalk deployment
# Called from Buildfile
./play/play evolutions:apply --%$PLAY_ID
