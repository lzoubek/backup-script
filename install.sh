DESTBIN=/usr/local/bin
DESTETC=/etc/backup


function check_deps() {
for cmd in  "tar" "chmod"  "scp" "ssh" "rsync"; do    
    which ${cmd} &> /dev/null
    if [ "$?" == "1" ];
    then
	echo "Checking for ${cmd} ...  !! Cannot found '${cmd}'"
	exit 1
    fi
    echo "Checking for ${cmd} ... `which ${cmd}`"
done
}
check_deps
echo "Copying files"
cp -v backup-script ${DESTBIN}
mkdir -p ${DESTETC}
cp -v etc/backup/* ${DESTETC}
 
