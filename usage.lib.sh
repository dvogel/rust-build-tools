usage() {
	echo "USAGE: $1"
  shift

	while [[ "$#" -gt 0 ]]; do
		echo "ERROR: $1"
		shift
	done

	exit 1
}

