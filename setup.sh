
  set +e
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  # test if nvm is present if not, throw away the error
  this_output=$(nvm  --version 2>/dev/null)


  if [ "$this_output" = "$NVM_VERSION" ]; then
    echo "NVM $NVM_VERSION is already installed skipping"
  else
    touch ~/.profile

    mkdir $HOME/.nvm
    curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash


    if [ "$NVM_DIR_ADDS" = "true" ]; then
      nvm_dir_adds
    fi
  fi

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  set -e