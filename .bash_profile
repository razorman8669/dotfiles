# Path to your dotfiles installation.
export DOTFILES="$HOME/.dotfiles"

# Load .bashrc .bash_prompt if exists
test -f ~/.bashrc && source ~/.bashrc
test -f ~/.bash_prompt && source ~/.bash_prompt

# The next line updates PATH for the Google Cloud SDK.
# Install from https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version
if [ -f '/Users/razor/google-cloud-sdk/path.bash.inc' ]; then . '/Users/razor/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/razor/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/razor/google-cloud-sdk/completion.bash.inc'; fi
