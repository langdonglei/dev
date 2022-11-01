curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
source "$NVM_DIR/bash_completion"
nvm install --lts
npm install -g nrm yrm yarn bower
nrm use taobao
yrn use taobao
yarn global add @vue/cli
