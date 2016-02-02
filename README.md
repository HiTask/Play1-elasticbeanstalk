# Play1-elasticbeanstalk
### How to run Play 1.x app in AWS Elastic Beanstalk Java container, plain Java - no Tomcat needed.

Turns out such deployment is full on undocumented surprises that you can't guess or read about. Took a while to make it work after days of digging in forums and asking AWS staff. Thanks to Francois@AWS!

There are few undocumented tricks not found anywhere on the web:

#### Procfile process must be "web:"

in Procfile, the process name must be `web:`. While AWS docuemtnation says you can call it anything you want, for this kind of process if it's not `web:` it will simply not work

#### You can not start Play directly from Procfile. 

Supervisor process will break when it encounters `%` in Procfile. And it will not substitute environment variables in Procfile.
Move play command to separate shell script. This way it will substitute Env vars and work correctly.

####  Use exec in shell file

You need the exec command there in order for supervisord to monitor the correct process id.

#### Bake play in

Do not try to install Play into instance, etc. Simplest worry-free way is to copy play into package
