# Sublime Text 2 Aliases
#unamestr = 'uname'

sublime_dir=$HOME/local/Sublime2

# create symlink, if doesn't exist
if [ ! -h $HOME/bin/subl ]; then
    mkdir -p $HOME/bin
    subl=$HOME/bin/subl
    ln -s $sublime_dir/sublime_text $subl
fi

if [[ $('uname') == 'Linux' ]]; then
    if [ -f $subl ]; then
        st_run() { nohup $subl $@ > /dev/null & }
    else
        st_run() { nohup $subl $@ > /dev/null & }
    fi
alias st=st_run
fi
alias stt='st .'


### Sublime 2 packages and user settings
# we are keeping this in Dropbox and just symlinking the needed directories
sublime_config_dir=$HOME/.config/sublime-text-2
dropbox_subl_dir=$HOME/Dropbox/Sublime2
# create Dropbox Sublime 2 dir if doesn't exist
if [ ! -d "${dropbox_subl_dir}" ]; then
    mkdir -p $dropbox_subl_dir
fi

if [ -d  "${sublime_config_dir}" ]; then
    dir_symlinks=(Installed\ Packages Pristine\ Packages Packages)
    foreach dir ($dir_symlinks); do
        # if not symlink, backup
        if [ ! -h "${sublime_config_dir}/$dir" ]; then
            mkdir -p ${sublime_config_dir}/bkp
            mv ${sublime_config_dir}/$dir ${sublime_config_dir}/bkp/$dir
        fi
    done
    ln -s -f $dropbox_subl_dir/* $sublime_config_dir/
fi

### Create application launcher in Ubuntu
launcher=/usr/share/applications/sublime.desktop
if [ ! -f $launcher ]; then
    version=$(subl -v)
    echo "
        [Desktop Entry]
        Version=$version
        Type=Application
        Terminal=false
        StartupNotify=true
        Icon=$sublime_dir/Icon/32x32/sublime_text.png
        Name=Sublime2
        Comment=Programming IDE
        Exec=$sublime_dir/sublime_text
        Categories=Application;Development;
    " | sudo tee $launcher >> /dev/null

    sudo update-desktop-database
fi