#!/bin/bash

echo -n "Launcher Name:  "
read name
echo -n "Container Name: "
read container
echo -n "Comment:        "
read comment
echo -n "Icon:           "
read icon

echo "Saving to $HOME/Desktop/$name.desktop"
cat <<EOF > "$HOME/Desktop/$name.desktop"
[Desktop Entry]
Version=1.0
Name=$name
Comment=$comment
Exec=docker start $container
Icon=$icon
Terminal=false
Type=Application
Categories=Application;
EOF
echo "Done!"
