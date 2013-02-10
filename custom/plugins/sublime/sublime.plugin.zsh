# Sublime Text 2 Aliases
#unamestr = 'uname'

local _sublime_ubuntu=/local/Sublime\ Text\ 2/sublime_text

if [[ $('uname') == 'Linux' ]]; then
	if [ -f $HOME/${_sublime_ubuntu} ]; then
		st_run() { nohup $HOME/${_sublime_ubuntu} $@ > /dev/null & }
	else
		st_run() { nohup $HOME/${_sublime_ubuntu} $@ > /dev/null & }
	fi
alias st=st_run
elif  [[ $('uname') == 'Darwin' ]]; then
	# Check if Sublime is installed in user's home application directory
	if [[ -a $HOME/${_sublime_darwin_subl} ]]; then
		alias st='$HOME/${_sublime_darwin_subl}'
	else
		alias st='${_sublime_darwin_subl}'
	fi
fi
alias stt='st .'


### Sublime 2 packages and user settings
sublime_config_dir=$HOME/.config/sublime-text-2
dropbox_subl_dir=$HOME/Dropbox/Sublime2
# create Dropbox Sublime 2 dir if doesn't exist
if [ ! -d "${dropbox_subl_dir}" ]; then
	mkdir -p $dropbox_subl_dir
fi

if [ -d  "${sublime_config_dir}" ]; then
	ln -s -f $dropbox_subl_dir/* $sublime_config_dir/
fi