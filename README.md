# config
My Config Files

# setup
```sh
# Make sure we have /usr/local/bin
sudo mkdir -p /usr/local/bin

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sudo env UV_INSTALL_DIR="/usr/local" INSTALLER_NO_MODIFY_PATH=1 sh

# Install just
uv tool install rust-just

# Copy just to /usr/local/bin
readlink -f ~/.local/bin/just | xargs -I{} -- sudo install {} /usr/local/bin

# Use justfile for everything else
/usr/local/bin/just bootstrap
```
