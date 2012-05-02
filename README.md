# Test4Theory script to change BOINC permissions in Mac OS X

This script changes the permissions of the BOINC client in Mac OS X to allow yout 
to run it under the user account of the system, so they can join the Test4Theory
project.

You can run this script by opening a terminal, changing directory into the download 
directory where the script resides, and executing the command:

    sh ./EnablingVirtualBox.sh

The output will tell you your usersname and the group admin, so you can go to the next step

    sudo  sh ./EnablingVirtualBox.sh yourusername admin
    (You will need to enter your Mac admin password if asked)

Finally you can attach your BOINC client to the project. All pre-existing projects 
will still work normally.

Note that this script has to be run again after each update of the BOINC client 
software is installed!
