#!/bin/sh
#

set -e
set -o pipefail

. "${dp_SCRIPTSDIR}/functions.sh"

validate_env dp_ECHO_MSG dp_GID_FILES dp_GID_OFFSET dp_GROUPS_BLACKLIST \
	dp_INSTALL dp_OPSYS dp_OSVERSION dp_PREFIX dp_PW dp_SCRIPTSDIR \
	dp_UG_DEINSTALL dp_UG_INSTALL dp_UID_FILES dp_UID_OFFSET \
	dp_USERS_BLACKLIST

[ -n "${DEBUG_MK_SCRIPTS}" -o -n "${DEBUG_MK_SCRIPTS_DO_USERS_GROUPS}" ] && set -x

set -u

USERS=$1
GROUPS=$2

error() {
	${dp_ECHO_MSG} "${1}"

	exit 1
}

# Lines from GID and UID files both contain *. As we do not need any pathname
# expansion, disable globbing.
set -f

rm -f "${dp_UG_INSTALL}" "${dp_UG_DEINSTALL}" || :

if [ "${dp_OPSYS}" = FreeBSD ] ; then
	cat >> "${dp_UG_INSTALL}" <<-eot
	if [ -n "\${PKG_ROOTDIR}" ] && [ "\${PKG_ROOTDIR}" != "/" ]; then
	  PW="${dp_PW} -R \${PKG_ROOTDIR}"
	else
	  PW=${dp_PW}
	fi
	eot
else
	echo "PW=${dp_PW}" >> "${dp_UG_INSTALL}"
fi

# Both scripts need to start the same, so
cp -f "${dp_UG_INSTALL}" "${dp_UG_DEINSTALL}"

if [ -n "${GROUPS}" ]; then
	for file in ${dp_GID_FILES}; do
		if [ ! -f "${file}" ]; then
			error "** ${file} doesn't exist. Exiting."
		fi
	done
	${dp_ECHO_MSG} "===> Creating groups."
	echo "echo \"===> Creating groups.\"" >> "${dp_UG_INSTALL}"
	for group in ${GROUPS}; do
		# _bgpd:*:130:
		if ! grep -q "^${group}:" ${dp_GID_FILES}; then \
			error "** Cannot find any information about group \`${group}' in ${dp_GID_FILES}."
		fi
		while read -r line; do
			# Do not change IFS for more than one command, if we
			# changed IFS around the while read, it would mess up
			# the string splitting in the heredoc command.
			o_IFS=${IFS}
			IFS=":"
			set -- ${line}
			IFS=${o_IFS}
			group=$1
			gid=$3
			if [ -z "${gid}" ]; then
				error "Group line for group ${group} has no gid"
			fi
			gid=$((gid+dp_GID_OFFSET))
			cat >> "${dp_UG_INSTALL}" <<-eot2
			if ! \${PW} groupshow $group >/dev/null 2>&1; then
			  echo "Creating group '$group' with gid '$gid'."
			  \${PW} groupadd $group -g $gid
			else
			  echo "Using existing group '$group'."
			fi
			eot2
		done <<-eot
		$(grep -h "^${group}:" ${dp_GID_FILES} | head -n 1)
		eot
	done
fi

if [ -n "${USERS}" ]; then
	for file in ${dp_UID_FILES}; do
		if [ ! -f "${file}" ]; then
			error "** ${file} doesn't exist. Exiting."
		fi
	done

	${dp_ECHO_MSG} "===> Creating users"
	echo "echo \"===> Creating users\"" >> "${dp_UG_INSTALL}"

	for user in ${USERS}; do
		# _bgpd:*:130:130:BGP Daemon:/var/empty:/sbin/nologin
		if ! grep -q "^${user}:" ${dp_UID_FILES} ; then
			error "** Cannot find any information about user \`${user}' in ${dp_UID_FILES}."
		fi
		while read -r line; do
			# Do not change IFS for more than one command, if we
			# changed IFS around the while read, it would mess up
			# the string splitting in the heredoc command.
			o_IFS=${IFS}
			IFS=":"
			set -- ${line}
			IFS=${o_IFS}
			login=$1
			uid=$3
			gid=$4
			class=$5
			gecos=$8
			homedir=$9
			shell=${10}
			if [ -z "$uid" ] || [ -z "$gid" ] || [ -z "$homedir" ] || [ -z "$shell" ]; then
				error "User line for ${user} is invalid"
			fi
			uid=$((uid+dp_UID_OFFSET))
			gid=$((gid+dp_GID_OFFSET))
			if [ -n "$class" ]; then
				class="-L $class"
			fi
			homedir=$(echo "$homedir" | sed "s|^/usr/local|${dp_PREFIX}|")
			cat >> "${dp_UG_INSTALL}" <<-eot2
			if ! \${PW} usershow $login >/dev/null 2>&1; then
			  echo "Creating user '$login' with uid '$uid'."
			  \${PW} useradd $login -u $uid -g $gid $class -c "$gecos" -d $homedir -s $shell
			else
			  echo "Using existing user '$login'."
			fi
			eot2
			case $homedir in
				/|/nonexistent|/var/empty)
					;;
				*)
					echo "echo \"===> Creating homedir(s)\"" >> "${dp_UG_INSTALL}"
					group=$(awk -F: -v gid=${gid} '$1 !~ /^#/ && $3 == gid { print $1 }' ${dp_GID_FILES})
					cat >> "${dp_UG_INSTALL}" <<-blah
					if [ -n "\${PKG_ROOTDIR}" ] && [ "\${PKG_ROOTDIR}" != "/" ]; then
					  HOMEDIR="\${PKG_ROOTDIR}/$homedir"
					  MDBDIR="-N \${PKG_ROOTDIR}/etc/"
					else
					  HOMEDIR="$homedir"
					  MDBDIR=""
					fi
					${dp_INSTALL} \${MDBDIR} -d -g $group -o $login \${HOMEDIR}
					blah
					;;
			esac
		done <<-eot
		$(grep -h "^${user}:" ${dp_UID_FILES} | head -n 1)
		eot
	done
fi

if [ -n "${GROUPS}" ]; then
	for group in ${GROUPS}; do
		# mail:*:6:postfix,clamav
		while read -r line; do
			# Do not change IFS for more than one command, if we
			# changed IFS around the while read, it would mess up
			# the string splitting in the heredoc command.
			o_IFS=${IFS}
			IFS=":"
			# As some lines do not have a fourth argument, provide
			# one so $4 always exists.
			set -- ${line} ""
			IFS=${o_IFS}
			group=$1
			gid=$3
			members=$4
			gid=$((gid+dp_GID_OFFSET))
			o_IFS=${IFS}
			IFS=","
			set -- ${members}
			IFS=${o_IFS}
			for login in "$@"; do
				for user in ${USERS}; do
					if [ -n "${user}" ] && [ "${user}" = "${login}" ]; then
						cat >> "${dp_UG_INSTALL}" <<-eot2
						if ! \${PW} groupshow ${group} | grep -qw ${login}; then
						  echo "Adding user '${login}' to group '${group}'."
						  \${PW} groupmod ${group} -m ${login}
						fi
						eot2
					fi
				done
			done
		done <<-eot
		$(grep -h "^${group}:" ${dp_GID_FILES} | head -n 1)
		eot
	done
fi

if [ -n "${USERS}" ]; then
	for user in ${USERS}; do
		if ! echo "${dp_USERS_BLACKLIST}" | grep -qw "${user}"; then
			cat >> "${dp_UG_DEINSTALL}" <<-eot
			if \${PW} usershow ${user} >/dev/null 2>&1; then
			  echo "==> You should manually remove the \"${user}\" user. "
			fi
			eot
		fi
	done
fi

if [ -n "${GROUPS}" ]; then
	for group in ${GROUPS}; do
		if ! echo "${dp_GROUPS_BLACKLIST}" | grep -qw "${group}"; then
			cat >> "${dp_UG_DEINSTALL}" <<-eot
			if \${PW} groupshow ${group} >/dev/null 2>&1; then
			  echo "==> You should manually remove the \"${group}\" group "
			fi
			eot
		fi
	done
fi
