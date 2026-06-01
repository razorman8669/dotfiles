# Loaded for login shells; defer everything to .bashrc.
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
# Install from https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi
