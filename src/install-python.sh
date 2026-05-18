#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  if [ "${RUNNER_OS}" = "macOS" ]; then
    log_info "Installing python 3.14 via brew..."
    log_debug "brew install python@3.14"
    brew install python@3.14
  elif [ "${RUNNER_OS}" = "Windows" ]; then
    log_info "Installing python 3.14 via choco..."
    log_debug "choco install python --version=3.14.5 -y"
    choco install python --version=3.14.5 -y
  else
    os=$(grep "^ID=" "/etc/os-release" | cut -d '=' -f 2)
    if [ "${os}" = "alpine" ]; then
      log_info "Installing python 3.14 via apk..."
      log_debug "echo https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories"
      echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
      log_debug "apk --no-cache --update add python3.14 py3-pip"
      apk --no-cache --update add python3.14 py3-pip
    else
      log_info "Installing python 3.14 via apt..."
      sudo_cmd=$(if command -v sudo >/dev/null 2>&1; then echo sudo; fi)
      log_debug "apt install -y software-properties-common"
      ${sudo_cmd} apt install -y software-properties-common
      log_debug "add-apt-repository ppa:deadsnakes/ppa -y"
      ${sudo_cmd} add-apt-repository ppa:deadsnakes/ppa -y
      log_debug "apt update"
      ${sudo_cmd} apt update
      log_debug "apt install -y python3.14 python3-pip python-is-python3"
      ${sudo_cmd} apt install -y python3.14 python3-pip python-is-python3
    fi
  fi
}

main "$@"
