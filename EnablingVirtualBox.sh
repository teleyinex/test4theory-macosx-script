#!/bin/sh

USER=`whoami`

if [ $# -eq 2 ]
then
    USER=$1
    GROUP=$2
else
    echo "usage: $0 $USER admin"
    exit
fi

echo "Checking if there is a BOINC client running..."

boincpid=$(ps axc|awk "{if (\$5==\"boinc\") print \$1}";)

if [ ! -z "$boincpid" ]; then
   echo "BOINC is running"
   echo "Please, quit BOINC and then run this script"
   exit
else
   echo "BOINC is not runnig..."
fi


echo "Setting up the BOINC installation ..."

boincdata="/Library/Application Support/BOINC Data/"
boincapp="/Applications/BOINCManager.app/"


if [ ! -d "$boincapp" ]
then
    echo "Can't find $boincapp Application; exiting"
    echo "Please re-install BOINC"
    exit
fi

echo "Enabling BOINC to work with VirtualBox..."

boincContentsMacOS="$boincapp"Contents/MacOS


mv "$boincContentsMacOS"/BOINCManager "$boincContentsMacOS"/BOINCManager.virtualbox

touch "$boincContentsMacOS"/BOINCManager
chmod ugo+rx "$boincContentsMacOS"/BOINCManager

echo  "#!/bin/sh" > "$boincContentsMacOS"/BOINCManager
echo  "" >> "$boincContentsMacOS"/BOINCManager
echo  "exec $boincContentsMacOS/BOINCManager.virtualbox -i" >> "$boincContentsMacOS"/BOINCManager

chown -R $USER:$GROUP "$boincapp"

if [ ! -d "$boincdata" ]
then
    echo "Can't find $boincdata folder; exiting"
    exit
fi

chown -R $USER:$GROUP "$boincdata"

echo "BOINC set up correctly."
