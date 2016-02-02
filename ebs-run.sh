#!/bin/sh
# Run script for elastic beanstalk
# enable the use of environment variable expansion via $, as well as using the % character without escaping.
# You need the exec command there in order for supervisord to monitor the correct process id.
exec ./play/play run -Dprecompiled=true --%$PLAY_ID
