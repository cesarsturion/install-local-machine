# fonts

Projeto para armazenar as fontes que uso no vscode e no oh-my-zsh

To Install fonts:

You can also double-click on the font file (or select Open with Font Viewer in the right-click menu). Then click the Install Font button.

If you need the fonts to be available system-wide, you'll need to copy them to /usr/local/share/fonts and reboot (or manually rebuild the font cache with fc-cache -f -v).

You can confirm they are installed correctly by running fc-list | grep "<name-of-font>"

Commands: 

sudo cp 'Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf' \
'Hack Bold Italic Nerd Font Complete.ttf' \
'Hack Bold Italic Nerd Font Complete Mono.ttf' \
'Hack Bold Italic Nerd Font Complete Windows Compatible.ttf' \
'Hack Bold Nerd Font Complete Mono.ttf' \
'Hack Bold Nerd Font Complete Mono Windows Compatible.ttf' \
'Hack Bold Nerd Font Complete.ttf' \
'Hack Bold Nerd Font Complete Windows Compatible.ttf' \
'Hack Italic Nerd Font Complete Mono.ttf' \
'Hack Italic Nerd Font Complete Mono Windows Compatible.ttf' \
'Hack Italic Nerd Font Complete.ttf' \
'Hack Italic Nerd Font Complete Windows Compatible.ttf' \
'Hack Regular Nerd Font Complete Mono.ttf' \
'Hack Regular Nerd Font Complete Mono Windows Compatible.ttf' \
'Hack Regular Nerd Font Complete.ttf' \
'Hack Regular Nerd Font Complete Windows Compatible.ttf' \
'Meslo LG M Regular Nerd Font Complete Mono.ttf' \
'Meslo LG M Regular Nerd Font Complete Mono Windows Compatible.ttf' \
'Meslo LG M Regular Nerd Font Complete.ttf' \
'Meslo LG M Regular Nerd Font Complete Windows Compatible.ttf' \
'MesloLGS NF Bold Italic.ttf' \
'MesloLGS NF Bold.ttf' \
'MesloLGS NF Italic.ttf' \
'MesloLGS NF Regular.ttf'  /usr/local/share/

sudo fc-cache -f -v
