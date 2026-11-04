#!/bin/sh
#
# Usage: merge-pkg-messages.sh <output> <message>...
#
# Print the message file to pass to mport.create -m, or nothing when none of
# the <message> files exist.  A single existing message is used as is.
# Several (pkg-message plus those added to _PKGMESSAGES by USES, e.g. php:ext)
# are merged into one UCL array written to <output>, as FreeBSD's
# create-manifest.sh does: UCL messages lose their enclosing [ ] lines and
# plain-text messages become an entry without a type, so they are still shown
# on every action.

set -eu

output=$1
shift

count=0
last=
for message; do
	if [ -f "${message}" ]; then
		count=$((count + 1))
		last=${message}
	fi
done

case ${count} in
0)
	exit 0
	;;
1)
	echo "${last}"
	exit 0
	;;
esac

{
	echo '['
	for message; do
		[ -f "${message}" ] || continue
		if head -1 "${message}" | grep -q '^\['; then
			sed '1d;$d' "${message}"
		else
			echo '{message=<<EOD'
			cat "${message}"
			# The heredoc terminator must start a line of its own.
			[ -z "$(tail -c 1 "${message}")" ] || echo
			printf 'EOD\n},\n'
		fi
	done
	echo ']'
} > "${output}"

echo "${output}"
