The Way Lab uses Linux distributions for our primary research computing.
Follow these instructions to set up your computer for the first time. If you’re stuck, ask questions.
All of these steps are likely to change in the future, and, if there are any incomplete or missing details, please modify.


## Step 0 - Build your machine!

Chances are you will not need to build your own machine; instead, you will probably have inherited one from a previous lab member.
In case you are curious, our builds are based off of [these parts](https://pcpartpicker.com/user/GregWay10/saved/#view=xx9shM), likely with some modifications.

If you do need to build your machine, you’re not on your own.
You will work with Greg or other lab members to complete the build.


## Step 1 - Install the operating system

We are currently experimenting with [Pop!\_OS](https://pop.system76.com/), an open source Ubuntu-based operating system built for STEM.
They’re [located](https://www.google.com/maps/place/System76/@39.7739202,-104.8288135,15z/data=!4m5!3m4!1s0x0:0xf63fca1ea6015d75!8m2!3d39.7739112!4d-104.8288302) just north of Anschutz as well.

Ask Greg, or another lab member, for the live USB.
The USB contains instructions for your new build to install version 20.04 of Pop!\_OS. 

**Alternative** - If no live USB is available: Visit this [website](https://pop.system76.com/) and click \`download\`.
We use the latest LTS, and, depending on Step 0, you may install the version with pre-loaded NVIDIA GPU drivers.
This click will download a \`.iso\` file. Download and open balenaEtcher, and, using a fresh USB (Note: it will delete everything on it already!) follow the prompts to move and format the \`.iso\` on the fresh USB.

Plug the USB into the new machine.


### Step 1.1 - Enter boot mode after powering on

When the motherboard first receives power, it will flash options to enter the boot menu.
Press F11 (or whatever the instructions tell you) to enter this mode.
If you’ve successfully entered the menu with the proper USB drive, you will see an option to boot from the USB (partition).

Click the proper USB drive, and the operating system will install.


### Step 1.1 - Greg will set up using his account

Greg will enter his credentials so that he always has access to all machines.
Don’t worry, we’ll set up your own account soon!


## Step 2 - Install core software

Setup github ssh keys

Open your terminal and make a directory called “repos”: \`mkdir repos\`

Navigate to <https://github.com/wayscience/onboarding>.
Create a fork using your username (create one if you haven’t already! Greg will add to the WayScience organization).

Sudo apt update

Sudo snap install atom –classic (or one of your other favorite IDEs)

(We like atom because it is open source and simple)

Install miniconda

Install docker sudo apt-get docker.io

Sudo groupadd docker

Sudo usermod -aG docker $USER

newgrp docker

docker run hello-world
