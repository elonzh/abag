# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.profile.d" ]; then
  for i in $HOME/.profile.d/*.sh; do
    if [ -r "$i" ]; then
      source "$i"
    fi
  done
  unset i
fi

# Turn off all beeps
unsetopt BEEP
