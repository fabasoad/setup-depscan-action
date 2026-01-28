#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  version="${1}"
  log_info "Installing @cyclonedx/cdxgen via npm..."
  npm install -g @cyclonedx/cdxgen
  log_info "Installing owasp-depscan via pip..."
  if [ "${version}" = "latest" ]; then
    python -m pip install owasp-depscan --break-system-packages
  else
    python -m pip install owasp-depscan=="${version}" --break-system-packages
  fi
}

main "$@"
