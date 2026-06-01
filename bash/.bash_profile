# Path to your dotfiles installation.
export DOTFILES="$HOME/.dotfiles"

# Load .bashrc .bash_prompt if exists
test -f ~/.bashrc && source ~/.bashrc
# Remove .bash_prompt in favor for starship prompt
# test -f ~/.bash_prompt && source ~/.bash_prompt

# The next line updates PATH for the Google Cloud SDK.
# Install from https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi
. "$HOME/.cargo/env"

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
