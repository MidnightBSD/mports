#
# $MidnightBSD: mports/Mk/bsd.pkg_tools.mk,v 1.1 2008/04/05 02:46:34 ctriv Exp $
#

#
# Compatibility layer for using the old FreeBSD pkg_* tools.
#

# PKG_DBDIR		- Where package installation is recorded; this directory
#				  must not contain anything else.
#				  Default: ${DESTDIR}/var/db/pkg


#
# Setup PKG_* variables.
#
.if !defined(DESTDIR)
PKG_CMD?=		/usr/sbin/pkg_create
PKG_ADD?=		/usr/sbin/pkg_add
PKG_DELETE?=	/usr/sbin/pkg_delete
PKG_INFO?=		/usr/sbin/pkg_info
PKG_VERSION?=	/usr/sbin/pkg_version
.else
PKG_CMD?=		${CHROOT} ${DESTDIR} /usr/sbin/pkg_create
PKG_ADD?=		${CHROOT} ${DESTDIR} /usr/sbin/pkg_add
PKG_DELETE?=	${CHROOT} ${DESTDIR} /usr/sbin/pkg_delete
PKG_INFO?=		${CHROOT} ${DESTDIR} /usr/sbin/pkg_info
PKG_VERSION?=	${CHROOT} ${DESTDIR} /usr/sbin/pkg_version
.endif

.if !defined(PKG_ARGS)
PKG_ARGS=	-v -c -${COMMENT:Q} -S ${FAKE_DESTDIR} -d ${DESCR} -f ${TMPPLIST} -p ${PREFIX}\
			-P "`cd ${.CURDIR} && ${MAKE} package-depends | ${GREP} -v -E ${PKG_IGNORE_DEPENDS} | ${SORT} -u`" \
			${EXTRA_PKG_ARGS} $${_LATE_PKG_ARGS} 
.if !defined(NO_MTREE)
PKG_ARGS+=		-m ${MTREE_FILE}
.endif
.if defined(PKGORIGIN)
PKG_ARGS+=		-o ${PKGORIGIN}
.endif
.if defined(CONFLICTS) && !defined(DISABLE_CONFLICTS)
PKG_ARGS+=		-C "${CONFLICTS}"
.endif
.endif

.if defined(PKG_NOCOMPRESS)
PKG_SUFX?=		.tar
.else
PKG_SUFX?=		.tbz
.endif

# where pkg_add records its dirty deeds.
PKG_DBDIR?=		/var/db/pkg



###############################################################################
#
# Targets
#

#
# do-package, make a package file.
#
do-package: ${TMPPLIST}
	@if ! ${MKDIR} -p ${PKGREPOSITORY}; then \
		${ECHO_MSG} "=> Can't create directory ${PKGREPOSITORY}."; \
		exit 1; \
	fi; 
	@__softMAKEFLAGS='${__softMAKEFLAGS:S/'/'\''/g}'; \
	_LATE_PKG_ARGS=""; \
	if [ -f ${PKGINSTALL} ]; then \
		_LATE_PKG_ARGS="$${_LATE_PKG_ARGS} -i ${PKGINSTALL}"; \
	fi; \
	if [ -f ${PKGDEINSTALL} ]; then \
		_LATE_PKG_ARGS="$${_LATE_PKG_ARGS} -k ${PKGDEINSTALL}"; \
	fi; \
	if [ -f ${PKGREQ} ]; then \
		_LATE_PKG_ARGS="$${_LATE_PKG_ARGS} -r ${PKGREQ}"; \
	fi; \
	if [ -f ${PKGMESSAGE} ]; then \
		_LATE_PKG_ARGS="$${_LATE_PKG_ARGS} -D ${PKGMESSAGE}"; \
	fi; \
	if ${PKG_CMD} -v ${PKG_ARGS} ${PKGFILE} >/dev/null; then \
		${ECHO_MSG} "Created ${PKGFILE}"; \
		cd ${.CURDIR} && eval ${MAKE} $${__softMAKEFLAGS} package-links; \
	else \
		cd ${.CURDIR} && eval ${MAKE} $${__softMAKEFLAGS} delete-package; \
		exit 1; \
	fi


#
# install-package, install a package file.
#
install-package:
.	if defined(DESTDIR) 
		@${CP} ${PKGFILE} ${DISTDIR}${PKGFILE}
.	endif
# $PKG_ADD calls chroot if DESTDIR is set.
	@${SETENV} PKG_PATH=${PKGREPOSITORY} ${PKG_ADD} ${PKGNAME}



#
# deinstall, remove all packages with the current origin and same prefix.
#
deinstall:
.if ${UID} != 0 && !defined(INSTALL_AS_USER)
	@${ECHO_MSG} "===>  Switching to root credentials for '${.TARGET}' target"
	@cd ${.CURDIR} && \
		${SU_CMD} "${MAKE} ${__softMAKEFLAGS} ${.TARGET}"
	@${ECHO_MSG} "===>  Returning to user credentials"
.else
.if !defined(DESTDIR)
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN}"
.else
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN} from ${DESTDIR}"
.endif
	@found_names=`${PKG_INFO} -q -O ${PKGORIGIN}`; \
	for p in $${found_names}; do \
			check_name=`${ECHO_CMD} $${p} | ${SED} -e 's/-[^-]*$$//'`; \
			if [ "$${check_name}" = "${PKGSUBNAME}" ]; then \
					prfx=`${PKG_INFO} -q -p $${p} 2> /dev/null | ${SED} -ne '1s|^@cwd ||p'`; \
					if [ "x${PREFIX}" = "x$${prfx}" ]; then \
							if [ -z "${DESTDIR}" ] ; then \
									${ECHO_MSG} "===>   Deinstalling $${p}"; \
							else \
									${ECHO_MSG} "===>   Deinstalling $${p} from ${DESTDIR}"; \
							fi; \
							${PKG_DELETE} -f $${p}; \
					else \
							${ECHO_MSG} "===>   $${p} has a different PREFIX: $${prfx}, skipping"; \
					fi; \
			fi; \
	done; \
	if [ -z "$${found_names}" ]; then \
			if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   ${PKGSUBNAME} not installed, skipping"; \
			else \
					${ECHO_MSG} "===>   ${PKGSUBNAME} not installed in ${DESTDIR}, skipping"; \
			fi; \
	fi
	@${RM} -f ${INSTALL_COOKIE}
.endif

#
# deinstall all packages matching our origin, regardless of prefix.
#
deinstall-all:
.if ${UID} != 0 && !defined(INSTALL_AS_USER)
	@${ECHO_MSG} "===>  Switching to root credentials for '${.TARGET}' target"
	@cd ${.CURDIR} && \
		${SU_CMD} "${MAKE} ${__softMAKEFLAGS} ${.TARGET}"
	@${ECHO_MSG} "===>  Returning to user credentials"
.else
.if !defined(DESTDIR)
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN}"
.else
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN} from ${DESTDIR}"
.endif
	@deinstall_names=`${PKG_INFO} -q -O ${PKGORIGIN}`; \
	if [ -n "$${deinstall_names}" ]; then \
		for d in $${deinstall_names}; do \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "===>   Deinstalling $${d}"; \
			else \
				${ECHO_MSG} "===>   Deinstalling $${d} from ${DESTDIR}"; \
			fi; \
			${PKG_DELETE} -f $${d}; \
		done; \
	else \
		if [ -z "${DESTDIR}" ] ; then \
			${ECHO_MSG} "===>   ${PKGORIGIN} not installed, skipping"; \
		else \
			${ECHO_MSG} "===>   ${PKGORIGIN} not installed in ${DESTDIR}, skipping"; \
		fi; \
	fi; \
	${RM} -f ${INSTALL_COOKIE}
.endif

#
# depends targets
#
.for deptype in EXTRACT PATCH FETCH BUILD RUN
${deptype:L}-depends:
.if defined(${deptype}_DEPENDS)
.if !defined(NO_DEPENDS)
	@for i in `${ECHO_CMD} "${${deptype}_DEPENDS}"`; do \
		prog=`${ECHO_CMD} $$i | ${SED} -e 's/:.*//'`; \
		dir=`${ECHO_CMD} $$i | ${SED} -e 's/[^:]*://'`; \
		if ${EXPR} "$$dir" : '.*:' > /dev/null; then \
			target=`${ECHO_CMD} $$dir | ${SED} -e 's/.*://'`; \
			dir=`${ECHO_CMD} $$dir | ${SED} -e 's/:.*//'`; \
		else \
			target="${DEPENDS_TARGET}"; \
			depends_args="${DEPENDS_ARGS}"; \
		fi; \
		if ${EXPR} "$$prog" : \\/ >/dev/null; then \
			if [ -e "$$prog" ]; then \
				if [ "$$prog" = "${NONEXISTENT}" ]; then \
					${ECHO_MSG} "Error: ${NONEXISTENT} exists.  Please remove it, and restart the build."; \
					${FALSE}; \
				else \
					if [ -z "${DESTDIR}" ] ; then \
						${ECHO_MSG} "===>   ${PKGNAME} depends on file: $$prog - found"; \
					else \
						${ECHO_MSG} "===>   ${PKGNAME} depends on file in ${DESTDIR}: $$prog - found"; \
					fi; \
					if [ ${_DEPEND_ALWAYS} = 1 ]; then \
						${ECHO_MSG} "       (but building it anyway)"; \
						notfound=1; \
					else \
						notfound=0; \
					fi; \
				fi; \
			else \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   ${PKGNAME} depends on file: $$prog - not found"; \
				else \
					${ECHO_MSG} "===>   ${PKGNAME} depends on file in ${DESTDIR}: $$prog - not found"; \
				fi; \
				notfound=1; \
			fi; \
		else \
			case $${prog} in \
				*\>*|*\<*|*=*)	pkg=yes;; \
				*)		pkg="";; \
			esac; \
			if [ "$$pkg" != "" ]; then \
				if ${PKG_INFO} "$$prog" > /dev/null 2>&1 ; then \
					if [ -z "${DESTDIR}" ] ; then \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package: $$prog - found"; \
					else \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package in ${DESTDIR}: $$prog - found"; \
					fi; \
					if [ ${_DEPEND_ALWAYS} = 1 ]; then \
						${ECHO_MSG} "       (but building it anyway)"; \
						notfound=1; \
					else \
						notfound=0; \
					fi; \
				else \
					if [ -z "${DESTDIR}" ] ; then \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package: $$prog - not found"; \
					else \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package in ${DESTDIR}: $$prog - not found"; \
					fi; \
					notfound=1; \
				fi; \
				if [ $$notfound != 0 ]; then \
					inverse_dep=`${ECHO_CMD} $$prog | ${SED} \
						-e 's/<=/=gt=/; s/</=ge=/; s/>=/=lt=/; s/>/=le=/' \
						-e 's/=gt=/>/; s/=ge=/>=/; s/=lt=/</; s/=le=/<=/'`; \
					pkg_info=`${PKG_INFO} -E "$$inverse_dep" || ${TRUE}`; \
					if [ "$$pkg_info" != "" ]; then \
						${ECHO_MSG} "===>   Found $$pkg_info, but you need to upgrade to $$prog."; \
						exit 1; \
					fi; \
				fi; \
			elif ${WHICH} "$$prog" > /dev/null 2>&1 ; then \
				if [ -z "${PREFIX}" ] ; then \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable: $$prog - found"; \
				else \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable in ${DESTDIR}: $$prog - found"; \
				fi; \
				if [ ${_DEPEND_ALWAYS} = 1 ]; then \
					${ECHO_MSG} "       (but building it anyway)"; \
					notfound=1; \
				else \
					notfound=0; \
				fi; \
			else \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable: $$prog - not found"; \
				else \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable in ${DESTDIR}: $$prog - not found"; \
				fi; \
				notfound=1; \
			fi; \
		fi; \
		if [ $$notfound != 0 ]; then \
			${ECHO_MSG} "===>    Verifying $$target for $$prog in $$dir"; \
			if [ ! -d "$$dir" ]; then \
				${ECHO_MSG} "     => No directory for $$prog.  Skipping.."; \
			else \
				${_INSTALL_DEPENDS} \
			fi; \
		fi; \
	done
.endif
.else
	@${DO_NADA}
.endif
.endfor


PACKAGE-DEPENDS-LIST?= \
	if [ "${CHILD_DEPENDS}" ]; then \
		installed=$$(${PKG_INFO} -qO ${PKGORIGIN} 2>/dev/null || \
			${TRUE}); \
		if [ "$$installed" ]; then \
			break; \
		fi; \
		if [ -z "$$installed" ]; then \
			installed="${PKGNAME}"; \
		fi; \
		for pkgname in $$installed; do \
			${ECHO_CMD} "$$pkgname ${.CURDIR} ${PKGORIGIN}"; \
		done; \
	fi; \
	checked="${PARENT_CHECKED}"; \
	for dir in $$(${ECHO_CMD} "${LIB_DEPENDS} ${RUN_DEPENDS}" | ${SED} -e 'y/ /\n/' | ${CUT} -f 2 -d ':') $$(${ECHO_CMD} ${DEPENDS} | ${SED} -e 'y/ /\n/' | ${CUT} -f 1 -d ':'); do \
		dir=$$(${REALPATH} $$dir); \
		if [ -d $$dir ]; then \
			if (${ECHO_CMD} $$checked | ${GREP} -qwv "$$dir"); then \
				childout=$$(cd $$dir; ${MAKE} CHILD_DEPENDS=yes PARENT_CHECKED="$$checked" package-depends-list); \
				set -- $$childout; \
				childdir=""; \
				while [ $$\# != 0 ]; do \
					childdir="$$childdir $$2"; \
					${ECHO_CMD} "$$1 $$2 $$3"; \
					shift 3; \
				done; \
				checked="$$dir $$childdir $$checked"; \
			fi; \
		else \
			${ECHO_MSG} "${PKGNAME}: \"$$dir\" non-existent -- dependency list incomplete" >&2; \
		fi; \
	done

package-depends:
	@${PACKAGE-DEPENDS-LIST} | ${AWK} '{print $$1":"$$3}'


# Show missing dependiencies
missing:
	@for dir in $$(${ALL-DEPENDS-LIST}); do \
		THISORIGIN=$$(${ECHO_CMD} $$dir | ${SED} 's,${PORTSDIR}/,,'); \
		installed=$$(${PKG_INFO} -qO $${THISORIGIN}); \
		if [ -z "$$installed" ]; then \
			${ECHO_CMD} $$THISORIGIN; \
		fi \
	done


#
# check to see how things went with a fake.
#
.if exists(${LOCALBASE}/bin/perl)
_CHKFAKE=chkfake.pl
.else
_CHKFAKE=chkfake
.endif

_CHKFAKE_SCRIPT_ARGS=	${TMPPLIST} ${FAKE_DESTDIR} ${PREFIX}
.if defined(SKIP_FAKE_CHECK)
_CHKFAKE_SCRIPT_ARGS+=	-s "${SKIP_FAKE_CHECK}"
.endif

check-fake: 
	@${PORTSDIR}/Tools/scripts/${_CHKFAKE} ${_CHKFAKE_SCRIPT_ARGS}
