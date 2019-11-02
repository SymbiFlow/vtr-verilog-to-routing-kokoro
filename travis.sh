if ! declare -F travis_nanoseconds &>/dev/null; then
function travis_nanoseconds() {
	return 0;
}
fi
export -f travis_nanoseconds
if ! declare -F travis_fold &>/dev/null; then
function travis_fold() {
	return 0;
}
fi
export -f travis_fold
if ! declare -F travis_time_start &>/dev/null; then
function travis_time_start() {
	return 0;
}
fi
export -f travis_time_start
if ! declare -F travis_time_finish &>/dev/null; then
function travis_time_finish() {
	return 0;
}
fi
export -f travis_time_finish
if ! declare -F travis_wait &>/dev/null; then
function travis_wait() {
	$@
	return $?;
}
fi
export -f travis_wait
