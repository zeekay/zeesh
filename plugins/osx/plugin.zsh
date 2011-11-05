# osx zeesh plugin
fpath=( ~/.zsh/plugins/osx/func $fpath )
autoload -U ~/.zsh/plugins/osx/func/*(:t)

export LSCOLORS=ExfxcxdxbxegedabagAcEx

export PATH=\
~/.bin:\
~/.zsh/plugins/osx/lib:\
~/.cabal/bin:\
/usr/local/share/python:\
/usr/local/share/python3:\
/Library/Frameworks/Python.framework/Versions/Current/bin:\
/usr/local/bin:\
/usr/local/sbin:\
/Developer/usr/bin:\
/usr/bin:\
/usr/sbin:\
/bin:\
/sbin

# no core dumps
limit core 0

compctl -K list_sysctls sysctl

alias ls='ls -AGF'
alias q1='qlmanage -p 2>/dev/null'
alias topc='top -o cpu'
alias topm='top - vsize'
alias hdimount='hdiutil mount'
alias hdidetach='hdiutil detach'
alias forceeject='hdiutil detach -force'
alias cwd='pwd | pbcopy'
alias gowd='cd "`pbpaste`"'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airPort'
alias o=open
alias pkill=zeesh_osx_pkill
alias kill='/bin/kill -9'
alias pk='zeesh_osx_pkill'
alias growl='zeesh_growlnotify'
alias xc='open *xcodeproj'
# plugin funcs
alias hide='zeesh_osx_hide'
alias hide_in_dock='zeesh_osx_hide_in_dock'
alias clear_scrollback='zeesh_osx_clear_scrollback'
alias fs_usage='fs_usage -w -f filesys'
alias zombiefinder='/System/Library/CoreServices/Finder.app/Contents/MacOS/Finder &'

upgrade_visor(){
    local p='/Applications'
    cp -rf $p/iTerm.app $p/iTermVisor.app
    mv $p/iTermVisor.app/Contents/MacOS/iTerm $p/iTermVisor.app/Contents/MacOS/iTermVisor
    defaults write $p/iTermVisor.app/Contents/Info CFBundleIdentifier com.googlecode.iterm2visor
    defaults write $p/iTermVisor.app/Contents/Info CFBundleExecutable iTermVisor
    defaults write $p/iTermVisor.app/Contents/Info CFBundleName iTermVisor
    defaults write $p/iTermVisor.app/Contents/Info LSUIElement 1
    rm -rf ~$p/iTermVisor.app
    mv $p/iTermVisor.app ~$p
}

lion_hacks() {
    # i like to repeat my self
    defaults write -g ApplePressAndHoldEnabled -bool NO
    # jesus no
    defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool NO
    defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool NO
    defaults write com.apple.Safari ApplePersistenceIgnoreState -bool YES
    # animoot
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO
    defaults write com.apple.Preview NSQuitAlwaysKeepsWindows 0
    # use new list-style, cmd+/- to change icon size
    defaults write com.apple.dock use-new-list-stack -bool YES
    # new dock
    defaults write com.apple.dock no-glass -bool YES
    # speed up sheets slide-in animation
    defaults write -g NSWindowResizeTime -float 0.01
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO
    killall Dock
}

edit_keymapping() {
    # To modify keyboard mappings navigate to com.apple.keyboard.modifiermapping.* and swap keycodes:
    # None            1
    # Caps Lock       0
    # Shift (Left)    1
    # Control (Left)  2
    # Option (Left)   3
    # Command (Left)  4
    # Keypad 0        5
    # Help            6
    # Shift (Right)   9
    # Control (Right) 10
    # Option (Right)  11
    # Command (Right) 12

    open ~/Library/Preferences/ByHost/.GlobalPreferences.*.plist
}

function disable_dynamic_pager() {
    sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist
    sudo rm -rf /var/vm/*
}
function enable_dynamic_pager() {
    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist
}
alias flushcache='dscacheutil -flushcache'
function ps() {
    if [ $1 ]; then
        /bin/ps $@
    else
        /bin/ps ux -U `whoami`
    fi
}
