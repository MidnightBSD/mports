# $MidnightBSD$
#
# Handles common items for kernel module ports.
#
# MAINTAINER: ports@MidnightBSD.org
#
# Feature:	kmod
# Usage:	USES=kmod
# Valid ARGS:	none
#
.if !defined(_INCLUDE_USES_KMOD_MK)
_INCLUDE_USES_KMOD_MK=	yes

_USES_POST+=	kmod

.if !empty(kmod_ARGS)
IGNORE=	USES=kmod takes no arguments
.endif

.if !exists(${SRC_BASE}/sys/Makefile)
IGNORE=	requires kernel source files in ${SRC_BASE}
.endif

CATEGORIES+=	kld

SSP_UNSAFE=	kernel module supports SSP natively

KMODDIR?=	/boot/modules
.if ${KMODDIR} == /boot/kernel
KMODDIR=	/boot/modules
.endif
PLIST_SUB+=	KMODDIR="${KMODDIR:C,^/,,}"
MAKE_ENV+=	KMODDIR="${KMODDIR}" SYSDIR="${SRC_BASE}/sys" NO_XREF=yes

STRIP_CMD+=	--strip-debug # do not strip kernel symbols
.endif

.if defined(_POSTMKINCLUDED) && !defined(_INCLUDE_USES_KMOD_POST_MK)
_INCLUDE_USES_KMOD_POST_MK=	yes

.PHONY: kmod-post-install
pre-install: ${KMODDIR}
${STAGEDIR}${KMODDIR}:
	${MKDIR} ${.TARGET}

post-install: kmod-post-install
kmod-post-install:
	${ECHO_CMD} "@exec /usr/sbin/kldxref ${KMODDIR}"  >> ${TMPPLIST}
	${ECHO_CMD} "@unexec /usr/sbin/kldxref ${KMODDIR}" >> ${TMPPLIST}
.if defined(NO_STAGE)
	/usr/sbin/kldxref ${KMODDIR}
.endif
.if ${KMODDIR} != /boot/modules
	${ECHO_CMD} "@unexec rmdir ${KMODDIR} 2>/dev/null || true" >> ${TMPPLIST}
.endif

.endif
