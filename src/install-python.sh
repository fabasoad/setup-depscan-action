#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  if [ "${RUNNER_OS}" = "macOS" ]; then
    log_info "Installing python@3.14 via brew..."
    log_debug "brew install python@3.14"
    brew install python@3.14
  elif [ "${RUNNER_OS}" = "Windows" ]; then
    log_info "Installing python via choco..."
    log_debug "choco install python -y"
    choco install python -y
  else
    os=$(grep "^ID=" "/etc/os-release" | cut -d '=' -f 2)
    if [ "${os}" = "alpine" ]; then
      log_info "Installing python3 and py3-pip via apk..."
      log_debug "apk --no-cache --update add python3 py3-pip"
      apk --no-cache --update add python3 py3-pip
    else
      log_info "Installing python3, python3-pip and python-is-python3 via apt..."
      log_debug "apt update"
      apt update
      log_debug "apt install -y python3 python3-pip python-is-python3"
      apt install -y python3 python3-pip python-is-python3
    fi
  fi
}

main "$@"
