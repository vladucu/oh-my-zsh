# Sublime Text 2 Aliases
#unamestr = 'uname'

sublime_dir=/opt/sublime_text
sublime=$sublime_dir/sublime_text

if [[ $('uname') == 'Linux' ]]; then
    if [ -f $sublime ]; then
        st_run() { nohup $sublime $@ > /dev/null & }
    else
        st_run() { nohup $sublime $@ > /dev/null & }
    fi
alias st=st_run
fi
alias stt='st .'


### Sublime 2 packages and user settings
# we are keeping this in Dropbox and just symlinking the needed directories
sublime_config_dir=$HOME/.config/sublime-text-3
dropbox_subl_dir=$HOME/Dropbox/sublime3
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
launcher=/usr/share/applications/sublime_text.desktop
if [ ! -f $launcher ]; then
    version=$($sublime -v)
    echo "
        [Desktop Entry]
        Version=1.0
        Type=Application
        Name=Sublime Text
        GenericName=Text Editor
        Comment=Sophisticated text editor for code, markup and prose
        Exec=/opt/sublime_text/sublime_text %F
        Terminal=false
        MimeType=text/plain;
        Icon=sublime-text
        Categories=TextEditor;Development;
        StartupNotify=true
        Actions=Window;Document;

        [Desktop Action Window]
        Name=New Window
        Exec=/opt/sublime_text/sublime_text -n
        OnlyShowIn=Unity;

        [Desktop Action Document]
        Name=New File
        Exec=/opt/sublime_text/sublime_text --command new_file
        OnlyShowIn=Unity;
    " | sudo tee $launcher >> /dev/null

    sudo update-desktop-database
fi