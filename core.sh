HERE="$(dirname "$(realpath "$0")")"
[ -f "$HERE/.env" ] && . "$HERE/.env"

set -e

printfc() {
	local color="$1"
	local msg="$2"
	shift 2
	printf "\e[${color}m${msg}\e[0m\n" "$@"
}

error() {
	printfc 31 "$@"
	exit 1
}

status() {
	printfc 36 "$@"
}

needroot() {
	if [ $(id -u) != 0 ]; then
	       error "Script %s needs to be run as root" "$0"
	fi	       
}
