#!/bin/bash

echo -n "Launcher Name:  "
read name
echo -n "Container Name: "
read container
echo -n "Comment:        "
read comment
echo -n "Icon:           "
read icon
echo -ne "Default Shell:  bash\rDefault Shell:  "
read shell

if [ "a$shell" == "a" ]; then
	shell="bash"
fi

echo "Saving to $HOME/Desktop/$name.desktop and $HOME/Desktop/$name - $shell.desktop"
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
cat <<EOF > "$HOME/Desktop/$name - $shell.desktop"
[Desktop Entry]
Version=1.0
Name=$name - $shell
Comment=$comment ($shell shell)
Exec=gnome-terminal -e "sh -c 'docker ps | grep $container || docker start $container; docker exec -i -t $container $shell'"
Icon=$icon
Terminal=false
Type=Application
Categories=Application;
EOF
chmod +x "$HOME/Desktop/$name.desktop" "$HOME/Desktop/$name - $shell.desktop"
echo "Done!"
