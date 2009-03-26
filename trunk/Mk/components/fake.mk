#
# $MidnightBSD: mports/Mk/components/fake.mk,v 1.3 2009/03/20 18:17:48 laffer1 Exp $
#
# fake.mk -- This file contains all the code for the 'fake' target.
#

################
#
# Fake Setup 
#
# Tmp dir used for building a package.
FAKE_INSTALLDIR?=	fake-inst-${ARCH}
FAKE_TARGET?=		${INSTALL_TARGET}
DESTDIRNAME?=   	DESTDIR
FAKE_DESTDIR?= 		${WRKDIR}/${FAKE_INSTALLDIR}
FAKE_MAKEARGS?=		${MAKE_ARGS} ${DESTDIRNAME}=${FAKE_DESTDIR}

FAKE_SETUP=		TRUE_PREFIX=${TRUE_PREFIX} PREFIX=${FAKE_DESTDIR}${TRUE_PREFIX} \
				MANPREFIX=${FAKE_DESTDIR}${MANPREFIX:S/^${FAKE_DESTDIR}//} \
				LINUXBASE=${FAKE_DESTDIR}${LINUXBASE:S/^${FAKE_DESTDIR}//} \
				HOME=/${PKGBASE}_installs_to_home \
				KMODDIR=${FAKE_DESTDIR}${KMODDIR:S/^${FAKE_DESTDIR}//}
		

.if defined(FAKE_OPTS)
.if ${FAKE_OPTS:Mtrueprefix}x != "x" 
# do this to FAKE_MAKEARGS so that post-install,pre-install still get a twiddled ${PREFIX}
FAKE_MAKEARGS+=	PREFIX=${TRUE_PREFIX} MANPREFIX=${MANPREFIX} DOCSDIR=${DOCSDIR} KMODDIR=${KMODDIR}
.endif
.if ${FAKE_OPTS:Mlibs}x != "x"
FAKE_SETUP+=	LD_LIBRARY_PATH=${FAKE_DESTDIR}${PREFIX}/lib
.endif
.if ${FAKE_OPTS:Mbin}x != "x"
FAKE_SETUP+=	PATH=${PATH}:${FAKE_DESTDIR}${PREFIX}/bin:${FAKE_DESTDIR}${PREFIX}/sbin
.endif
.if ${FAKE_OPTS:Mprefixhack}x != "x"
FAKE_MAKEARGS+=	prefix=${FAKE_DESTDIR}${TRUE_PREFIX} infodir=${FAKE_DESTDIR}${TRUE_PREFIX}/${INFO_PATH}
FAKE_MAKEARGS+=	mandir=${FAKE_DESTDIR}${MANPREFIX}/man MANDIR=${FAKE_DESTDIR}${MANPREFIX}/man
.endif
.endif

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
	@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${FAKE_SETUP}\
		${_MAKE_CMD} -f ${MAKEFILE} ${FAKE_MAKEARGS} ${FAKE_TARGET};
.	if defined(USE_IMAKE) && !defined(NO_INSTALL_MANPAGES)
		@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${FAKE_SETUP}\
			${_MAKE_CMD} -f ${MAKEFILE} ${FAKE_MAKEARGS} install.man
.	endif


.if !target(fix-fake-symlinks) 
fix-fake-symlinks:
	-@cd ${FAKE_DESTDIR}${PREFIX}; \
	links=`${FIND} . -type l | ${GREP} -v -e 'share/nls/POSIX\|share/nls/en_US.US-ASCII`; \
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
