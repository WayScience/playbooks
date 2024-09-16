# Remote Access

In a hybrid working world, we require solutions to use our powerful computers from anywhere. CU Anschutz OIT office has a solution for us.
Follow these steps to enable ssh or remote desktop access.

### Secure Socket Shell (SSH)

**Step 1A**. On your home computer, install ssh.

- If typing `ssh` in the terminal does not work, install by:

  - `sudo apt-get install openssh-client`

- For Mac users, you can install by:

  - `brew install openssh`

### Step 2 - Install OpenSSH server on Waylab computer

**Step 2A**. On your Waylab machine, install openssh-server.

- If typing ssh localhost prints the following error (see below), install ssh-server

  - `ssh: connect to host localhost port 22: Connection refused username@host:~$`

  - Install ssh server with:

    - `sudo apt-get install openssh-server ii.`

- Test the install with `sudo service ssh status`

### Step 3 - Connect to Waylab Computer

**Step 3A**. Obtain the IP address for your Waylab computer

- Existing IP addresses ([document](https://docs.google.com/spreadsheets/d/1xTQ9eLwazsbBByJ0mxU5D9X4t-sJlr2m3k_sp2nrBr4/edit#gid=0))

- Or type `ifconfig -a` and find _inet_ number (looks like XXX.XXX.XX.XXX)

  - This is the Waylab Machine’s IP address

**Step 3B**. On your home computer, open a terminal

**Step 3C**. Connect to the University VPN prior to establishing a connection to your Waylab Machine.

- Download Global Protect from CU anschutz website ([link](https://www.ucdenver.edu/offices/office-of-information-technology/software/how-do-i-use/vpn-and-remote-access))

- Follow the instructions provided CU anschutz (based on Operating System type)

  - [Windows](https://www.ucdenver.edu/docs/default-source/offices-oit-documents/vpn-client-software/windows---globalprotect-vpn-installation-instructions.pdf?sfvrsn=e1579eb8_6)

  - [MacOs](https://www.ucdenver.edu/docs/default-source/offices-oit-documents/vpn-client-software/mac---globalprotect-vpn-installation-instructions.pdf?sfvrsn=89559eb8_11)

  - [How-to for Linux](https://www.ucdenver.edu/docs/default-source/offices-oit-documents/vpn-client-software/linux---globalprotect-vpn-installation-instructions_v3.pdf?sfvrsn=cd0c9ab8_2)

- Once download it, open up Global Protect VPN

  - Enter CU anschutz username and password (this step assumes you have already follow the installation instructions)

  - Once you see the \`connected\` message, your VPN is active!

**Step 3D**. Login using your Waylab computer username on your home computer

- `ssh WAYLAB_USERNAME@WAYLAB_COMPUTER_IP_ADDRESS`

- If you are connecting for the first time you will need to hit ENTER to add the appropriate ECDSA key fingerprint

- You should see the name of the remote computer in your terminal.

For more details see this post: <https://phoenixnap.com/kb/ssh-to-connect-to-remote-server-linux-or-windows>

## Remote Desktop

### Step 1 - Is remote desktop enabled?

**Step 1A**. Check [waylab computers](https://docs.google.com/spreadsheets/d/1xTQ9eLwazsbBByJ0mxU5D9X4t-sJlr2m3k_sp2nrBr4/edit#gid=0) to see if remote desktop is enabled.

**Step 1B**. If not, reach out to OIT office by filing a ticket (go to the [OIT portal](https://servicecenter.oit.ucdenver.edu/CherwellPortal/IT?_=67e6572e#0) and submit a ticket include details of computer name and IP address in the ticket)

### Step 2 - Download xRDP on your Waylab Machine

**Step 2A**. Follow these instructions: <https://c-nergy.be/blog/?p=16637>

### Step 3 - Download vmware horizon on your home computer

**Step 3A**. Navigate to <https://remote.ucdenver.edu/>

**Step 3B**. Click on “Install VMware Horizon Client”

**Step 3C**. Download the client according to your home computer operating system (e.g. mac)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcGKvbrK-HUDrBdh9el43j0L-c4kIvbVJSk2xleUl50iTqN8iWT2Ca6Wr4UWEAHIEymKVeC8jqm_KADOjEU449PC5pb9JUYhadkTuyov0m4zXMlV85XXt0HeMN95fc3Wo9uVdblCo2vCmEc7ovtmQha2Vo?key=TLjRbfzMIq3LlXZ5yB1O3Q)

### Step 4 - Connect to server

**Step 4A**. Open VMware horizon and connect to new server

**Step 4B**. The server name is [`https://remote.ucdenver.edu/`](https://remote.ucdenver.edu/)

**Step 4C**. Use your University credentials to login

**Step 4D**. Fill in tokencode using Duo 2FA

**Step 4E**. Either “complimentary” or “Remote Desktop Client” will work (we have not tested either yet to know which we prefer).

**Step 4F**. If you selected “complimentary”, you will need to run “Remote Desktop” on the new windows machine that boots.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdtbWyluKU2y-XHt6j_py9IYA4ALpNWqGJowyPDymX3m2baFMev9XNJQ2SRguvGY9RSjkUzX_s9UzwZCPgIQC-WAmdvcMrbQhj98fxY61X3YSZ-8qxVbsXqyR3y30RRaTwUmw2VaURfsa3DCjV3pWrkf2s?key=TLjRbfzMIq3LlXZ5yB1O3Q)

### Step 5 - Login to Waylab machine remotely

**Step 5A**. Open VMware horizon and connect to new server

**Step 5B**. Enter computer name (e.g. fig) or IP address, connect

**Step 5C**. ???

**Step 5D**. Profit

(we actually don’t know what happens next since we haven’t tested it)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdcNtESHBrdgF4GbNWM3p-FwZN6ovGlttDpVGYfJnLRe5sgv51d5-5KLnHcBuJyl8ZaAvEPSOncEYOyp8xZ3yQbmVdofSU9lv2amj5acKyxbNUpmQvMpEnUrIRY6eHXVGjLMLx_a1hkCXb-JqhyynjbTMA?key=TLjRbfzMIq3LlXZ5yB1O3Q)

## VS Code SSH remote editor

This will allow you to write and execute code to a remote computer through vscode.

### Step 1- Download SSH plugin

**Step 1A.** Open VS code and head to the extension page by clicking the four square icon on the left sidebar panel.

**Step 1B**. type \`ssh\` in the search bar at the top and download “Remote remote” by clicking “install”

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdqUKEUhrkHIjrKY4npiOzrmfSM12eZbIzjDwi7IHEuGjasDgalrzLfkKbwJWCYJdGdfQAEUU6RlhsqIvTYE1vSTRxSMr2MNeZoJWD4urdQKF1IiBYZHorxp4gL9PBZ7SlyNmZHlwufPkDTx88a6lJ-SlA?key=TLjRbfzMIq3LlXZ5yB1O3Q)

### Step 2 - Set up SSH on your VScode editor

**Step 2A**. After downloading the extension, a small little icon should appear at the bottom left corner (look at the red arrow).

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeI6D7-MFI_F5ePweuNp9Rf7NnnrGPDQpRsyXScPTqIIT8QtjDCVkxni-kQx3MJh-qAu4RXKCg6Ykbi24IIG6mLl4SiOdjuMiOGIbqnkcieMBcJAsB0G4STKRDypINPqYGNnBfStn-kT7KS16k43Tpul8U?key=TLjRbfzMIq3LlXZ5yB1O3Q)

**Step 2B.** Then at the top, a drop down menu should appear and click on “connect to host”.

**Step 2C.** Then click where it says “ Add SSH host”  and type your ssh command.

- For example: `ssh username@computer.ip.address`

- Then press enter

**Step 2D.** A new window will open and at the top of your editor it will be asking for your password.

- This password is the same password you use to log into your Waylab machine.

**Step 2E**. After entering your password, the IP address should appear at the bottom left corner.
This means you are connected to the remote machine via VScode!
Next step is to look for the directory where you want to start coding!

**Step 2F**. To exit out from the remote editor, click on the IP address at the bottom left corner of your editor and click “close remote connection”

## Chrome Remote Desktop

This will allow you to remote-desktop access Way Lab computer from another computer in Chrome Web browser. Works without VPN connection.

### Step 1 - Set up via SSH

**Step 1A.** Set up SSH connection to Way Lab computer as described in “[Secure Socket Shell (SSH)](#secure-socket-shell-ssh)"

**Step 1B**. Go to [remotedesktop.google.com](https://remotedesktop.google.com/) and select “access my computer in the top right”.

**Step 1C**. Select “Set up via SSH” from menu on left of Chrome Remote Desktop home screen.

**Step 1D**. Follow steps to set up via SSH.
May need to create a remote desktop pin for Google account by clicking “remote access” before being able to login to remote desktop on Way Lab computer.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcbU2lEMn3D_OgxfvWRHEksZuZ7SB1fdN1tIBFwAS6vXvm6Wzn9CIGuIgcnopK3UJi_aS0V6LGbRXln2Elg6Ev-pNFliAmXfJMKr-DxTk8cXdffPUjpEbhiUfzLfyUGl-rw4JzmA6VkeTrRidHteTsCeAbz?key=TLjRbfzMIq3LlXZ5yB1O3Q)

### Step 2 - Connect to Way Lab Computer

**Step 2A**. Select “Remote Access” from menu on left of Chrome Remote Desktop home screen.

**Step 2B**. Select Way Lab computer from remote devices. Ex: maple shown below

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdXUCNBC4W7p4JxETYC5rB5pIPjLPICRJptyRl7pugZxNsi8ofhcQz7UfMcrjisk45Xn7biQtKvCQu2lGgQlT3aG0S3UjZgr3RzSLbtW_kfwZYfnb1TUT9zoAc3GKTFnotRYcpkt01hld08zJsNBmA6UsYI?key=TLjRbfzMIq3LlXZ5yB1O3Q)

**Step 2C**. Upon first connection, select Pop OS for loading and enter Way Lab computer password when prompted.
If any POP OS authentication does not work, click “cancel”.
Some authentications do not seem to work but remote desktop still works.
Might have to click cancel multiple times.

## Microsoft Remote Desktop and xRDP

This will allow you to remote into a Way Lab Computer to use the desktop and all of the applications.
This is an alternative to the Chrome Remote Desktop if that doesn’t work for your machine (this method requires VPN).

Important Note: Make sure you are logged out of your account as you can not use this method if you are still logged in on your Way Lab computer.

### Step 1 - Install xRDP on Way Lab Computer

**Step 1A**. On your Way Lab machine, install xRDP.

- Install ssh server with:

  - `sudo apt-get install xrdp`

- To see if the install worked properly, check the version with:

  - `xrdp -v`

### Step 2 - Install OpenSSH client on home computer

**Step 2A**. On your home computer, install Microsoft Remote Desktop from your computer's specific digital distribution platform (e.g. App Store for Mac, etc.).

**Step 2B**. After opening the application, it should open the prompt to add a PC.
If not, click the “+” button and click “Add PC” to pull up the prompt.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcXyxu0us_aA8zla7FnGS9TNdvo00OCIiHj3HbeDoh-m3dG4cvPOo9WkpRjRBDejYTRbQnAjVLdyczc0uMUI8_ZszFibsYwxZ-7NMiR0L4fvpeJPJ91943mckj1xOnvHNykLQR3Bcst_7m3shBTXcElqZSI?key=TLjRbfzMIq3LlXZ5yB1O3Q)

**Step 2C**. Make sure you are connected to the University VPN before inputting the information.
Once you have inputted the info, click “add”.

Note: It might give you a warning saying “The identity of the remote PC can't be verified.
Do you want to connect anyway?”.
Just connect anyway and select the do not ask for this PC again option.

**Step 2D**. Put the username and password to the Way Lab computer and hit continue.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfq7__jrSW3vMMay0t0aGxXGVdGDlBqCB7QfxshrxoitUZt0OQhzjzQQa4AMPfIQr8che3bFOE8DkQe3YfUo8xMYE63A9-EBLZrWfovWMvAdStsDRPPnjp8r6bmiRXIeR9AreKQVS08Ta17EXHH8omH3I4y?key=TLjRbfzMIq3LlXZ5yB1O3Q)

**Step 2E**. Now you can use your computer! Make sure to log out after you have done remoting into the Way Lab computer.

## How to reboot your machine remotely

If your remote machine ends up freezing or you forgot to log out of your machine before leaving work and now you can’t log into to your remote session, then these instructions are for you!
This will show you how to use ssh in terminal to reboot your machine.

**Step 1**. Use ssh to remote into the machine terminal (see full instructions above).

- Example: `ssh username:IP-address`

**Step 2**. Try to make sure any jobs you are running have finished unless you are okay with it stopping a run.
The example below shows that the run had completed since there are two SQLite files in the folder.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfEatcZ7pGjZ0np1GpOx1W6eYCayPOOPOqajAEk339hmP2fMn4IX5RhuqtgfxeMQ2gN41tn0p-74Rbxqw0T4zHXLyu71P6olPTXOhkrJU0DGeqL4HOpRsnKxIVmy0H6Qz6rT35f01Enu2cBWLD0zA0f63NJ?key=TLjRbfzMIq3LlXZ5yB1O3Q)

**Step 3:** Perform the reboot using the command: `sudo reboot`

**Step 4:** Wait for 10 seconds and attempt to remote into the computer.
