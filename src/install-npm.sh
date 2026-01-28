#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  if [ "${RUNNER_OS}" = "macOS" ]; then
    log_info "Installing node via brew..."
    brew install node
  elif [ "${RUNNER_OS}" = "Windows" ]; then
    log_info "Installing nodejs-lts via choco..."
    choco install nodejs-lts
  else
    os=$(grep "^ID=" "/etc/os-release" | cut -d '=' -f 2)
    if [ "${os}" = "alpine" ]; then
      log_info "Installing npm via apk..."
      apk --no-cache --update add npm
    else
      log_info "Installing npm via apt..."
      apt update
      apt install -y npm
    fi
  fi
}

main "$@"
