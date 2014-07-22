##SeleniumOps

These are the scripts responsible for starting/stopping selenium node and selenium grid servers.

###Installation
Pre-reqs: 

- Java 1.6 or later
- Centos 6.x (currently deployed to 6.4)
- Xvfb
- Fluxbox

Copy all the scripts in `/etc/init.d` to the target server's `/etc/init.d/`

Edit `seleniumops.conf` to your specs. Be sure to update the hub server url and the number of instances that should be created per node. Rule of thumb is 2 instances per CPU (i.e. 2 core CPU = 4 instances).

Place the selenium directory to `/data/selenium` and within that directory run `./setupSelenium.sh`. This will 
download selenium `2.40` and create the needed symlink.

Create a user called `fluxd` that the node will run as along with its home directory. This can be any user of your choosing as well. Just update it in the `seleniumops.conf` file.

If you update any of the directories above just update the appropriate settings in the `seleniumops.conf` file.

###To make the hub
Run `/etc/init.d/selenium-hub start`  
This can run on the same server or more ideally a different one.

###To make a node
In the following order run:

- `/etc/init.d/xvfb-multid start`
- `/etc/init.d/fluxboxd start`
- `/etc/init.d/selenium-multinode start`

###To do

- Combine all the init files to one start up script
