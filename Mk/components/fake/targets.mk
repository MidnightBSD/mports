#
# $MidnightBSD: mports/Mk/components/fake.mk,v 1.5 2009/03/30 14:27:11 laffer1 Exp $
#
# fake/targets.mk -- This file contains the targets that make up the top level 'fake'
#                    target.
#


FAKE_MAKEARGS+= ${EXTRA_FAKE_MAKEARGS}

.if !target(fake-dir) 
fake-dir:
	@${INSTALL} -d -m 755 -o root -g wheel ${FAKE_DESTDIR}${PREFIX}  
.if !defined(NO_MTREE)
	@${MTREE_CMD} ${MTREE_ARGS} ${FAKE_DESTDIR}${PREFIX} >/dev/null
.	if ${MTREE_FILE} == "/etc/mtree/BSD.local.dist" 
		@cd ${FAKE_DESTDIR}${PREFIX}/share/nls; \
		${LN} -shf C POSIX; \
		${LN} -shf C en_US.US-ASCII; 
.	endif
.	if defined(USE_LINUX) && ${PREFIX} != ${LINUXBASE_REL} 
		@${INSTALL} -d -m 755 -o root -g wheel ${FAKE_DESTDIR}${LINUXBASE_REL}
		@${MTREE_CMD} ${MTREE_LINUX_ARGS} ${FAKE_DESTDIR}${LINUXBASE_REL} > /dev/null
.	endif
.endif
.endif


.if !target(fake-pre-install) 
fake-pre-install:
.   if target(pre-install)
		@cd ${.CURDIR} && exec ${MAKE} pre-install ${FAKE_SETUP}
.   endif
.endif

	
.if !target(fake-pre-su-install)
fake-pre-su-install:
.   if target(pre-su-install)
		@${ECHO_MSG} "===>   WARNING: pre-su-install is deprecated. Use pre-install instead."
		@cd ${.CURDIR} && exec ${MAKE} pre-su-install ${FAKE_SETUP}
.   endif
.endif


.if !target(do-fake) 
do-fake:
.	if target(do-install)
		@cd ${.CURDIR} && exec ${MAKE} do-install ${FAKE_SETUP}
.	else
		@cd ${.CURDIR} && exec ${MAKE} run-fake
.	endif
.endif

.if !target(fake-post-install)
fake-post-install:
.	if target(post-install)
		@cd ${.CURDIR} && exec ${MAKE} post-install ${FAKE_SETUP}
.	endif
.endif


run-fake:
.if ${MAKE_CMD} == "ninja"
	@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${FAKE_SETUP}\
		${MAKE_CMD} ${MAKE_ARGS} ${MAKEFILE} ${FAKE_MAKEARGS} ${FAKE_TARGET};
.	if defined(USE_IMAKE) && !defined(NO_INSTALL_MANPAGES)
		@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${FAKE_SETUP}\
			${MAKE_CMD} ${MAKE_ARGS} ${MAKEFILE} ${FAKE_MAKEARGS} install.man
.	endif
.else
	@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${FAKE_SETUP}\
		${MAKE_CMD} -f ${MAKEFILE} ${FAKE_MAKEARGS} ${FAKE_TARGET};
.       if defined(USE_IMAKE) && !defined(NO_INSTALL_MANPAGES)
		@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${FAKE_SETUP}\
			${MAKE_CMD} -f ${MAKEFILE} ${FAKE_MAKEARGS} install.man
.       endif
.endif


.if !target(fix-fake-symlinks) 
fix-fake-symlinks:
	-@cd ${FAKE_DESTDIR}${PREFIX}; \
	links=`${FIND} . -type l | ${GREP} -v -e 'share/nls/POSIX\|share/nls/en_US.US-ASCII'`; \
	for link in $$links; do \
		if ! readlink $$link | grep ${FAKE_DESTDIR} >/dev/null; then \
			continue; \
		fi; \
		source=`readlink $$link | ${SED} -e 's|${FAKE_DESTDIR}||'`; \
		${RM} $$link; \
		${LN} -s $$source $$link; \
	done 
.	if defined(USE_LINUX) && ${PREFIX} != ${LINUXBASE_REL}
		@cd ${.CURDIR} && ${MAKE} PREFIX=${LINUXBASE_REL} ${.TARGET}
.	endif
.endif




#
# check-fake
#	
_CHKFAKE_ARGS= -f ${TMPPLIST} -d ${FAKE_DESTDIR} -p ${PREFIX}
.if defined(SKIP_FAKE_CHECK)
_CHKFAKE_ARGS+=	-s "${SKIP_FAKE_CHECK}"
.endif

.if !target(check-fake)
check-fake:
#	/usr/mports/Tools/scripts/chkfake.pl ${_CHKFAKE_ARGS}
	@${MPORT_CHECK_FAKE} ${_CHKFAKE_ARGS}
.endif
