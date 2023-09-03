#i want to copy files from ./ShowGenerator to /media/lucas/07FB-F3A6/grandMA3/gma3_library/datapools/plugins/

# copy files from ./ShowGenerator in the  /media/lucas/GMA3USB/grandMA3/gma3_library/datapools/plugins folder

for file in ./ShowGenerator/*.xml
do
    echo "copying $file"
    cp "$file" /media/lucas/GMA3USB/grandMA3/gma3_library/datapools/plugins
done

for file in ./ShowGenerator/*.lua
do
    echo "copying $file"
    cp "$file" /media/lucas/GMA3USB/grandMA3/gma3_library/datapools/plugins
done