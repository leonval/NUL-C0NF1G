# --- Archive Extractor ---
ex() {
	if [ -f "$1" ]; then
		case "$1" in
		*.tar.bz2) tar xjf "$1" ;;
		*.tar.gz) tar xzf "$1" ;;
		*.bz2) bunzip2 "$1" ;;
		*.rar) unrar x "$1" ;;
		*.gz) gunzip "$1" ;;
		*.tar) tar xf "$1" ;;
		*.tbz2) tar xjf "$1" ;;
		*.tgz) tar xzf "$1" ;;
		*.zip) unzip "$1" ;;
		*.Z) uncompress "$1" ;;
		*.7z) 7z x "$1" ;;
		*.deb) ar x "$1" ;;
		*.tar.xz) tar xf "$1" ;;
		*.tar.zst) tar xf "$1" ;;
		*) echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# --- cd up helper (e.g. cu 3) ---
cu() {
	local count=${1:-1}
	local upath=""
	for i in {1..$count}; do
		upath+="../"
	done
	cd "$upath"
}

# --- Git modified files helper ---
vimod() {
	nvim -p $(git status -suall | awk '{print $2}')
}

virev() {
	local commit=${1:-HEAD}
	local rootdir=$(git rev-parse --show-toplevel)
	local sourceFiles=($(git show --name-only --pretty="format:" "$commit" |
		grep -v '^$'))
	local toOpen=()
	for file in $sourceFiles; do
		local fullpath="$rootdir/$file"
		[ -e "$fullpath" ] && toOpen+=("$fullpath")
	done
	if [ ${#toOpen[@]} -eq 0 ]; then
		echo "No files were modified in $commit"
		return 1
	fi
	nvim -p "${toOpen[@]}"
}

# --- Memory cleaning helper ---
buffer_clean() {
	free -h && sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches' && free -h
}
