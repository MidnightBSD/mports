#
# $MidnightBSD: mports/Mk/components/fake.mk,v 1.5 2009/03/30 14:27:11 laffer1 Exp $
#
# fake/vars.mk -- This file contains the variable definitions for the 'fake' target.
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
FAKE_MAKEARGS?=		${MAKE_ARGS}

FAKE_SETUP=		TRUE_PREFIX=${TRUE_PREFIX} PREFIX=${FAKE_DESTDIR}${TRUE_PREFIX} \
				MANPREFIX=${FAKE_DESTDIR}${MANPREFIX:S/^${FAKE_DESTDIR}//} \
				LINUXBASE=${FAKE_DESTDIR}${LINUXBASE:S/^${FAKE_DESTDIR}//} \
				HOME=/${PKGBASE}_installs_to_home \
				KMODDIR=${FAKE_DESTDIR}${KMODDIR:S/^${FAKE_DESTDIR}//}

# For FreeBSD ports compatibility, we honor _DESTDIR_VIA_ENV which sets
# DESTDIR to make args by default and env if needed (ninja)
.if defined(_DESTDIR_VIA_ENV)
# equivalent to MAKE_ENV
FAKE_SETUP+=	${DESTDIRNAME}=${FAKE_DESTDIR}
.else
FAKE_MAKEARGS+=	${DESTDIRNAME}=${FAKE_DESTDIR}
.endif

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

