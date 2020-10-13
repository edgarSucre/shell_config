# shell_config

## Add this to .bashrc
```
#Cargar la configuracion de bash
if [ -f $HOME/.config/shell_config/bash_configuration ]; then
	. $HOME/.config/shell_config/bash_configuration
else
	echo "Recuerda clonar la configuración de bash"
fi
```