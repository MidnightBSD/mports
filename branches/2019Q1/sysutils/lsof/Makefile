# $MidnightBSD$

PORTNAME=	lsof
PORTVERSION=	4.92B
CATEGORIES=	sysutils
MASTER_SITES=	ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/ \
		ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/NEW/ \
		FREEBSD_LOCAL/ler/lsof
DISTNAME=	${PORTNAME}_${PORTVERSION}${DISTNAME_SUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists information about open files (similar to fstat(1))

LICENSE=	lsof
LICENSE_NAME=	lsof
LICENSE_FILE=	${FILESDIR}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

#Please leave the below line in for the next clean up.
FIXUP_RELEASE=	YES
.if defined(FIXUP_RELEASE)
DISTNAME_SUFFIX=.freebsd
.else
SRCBALL_NAME=	${DISTNAME:S/_W$//}_src
WRKSRC=		${WRKDIR}/${DISTNAME}/${SRCBALL_NAME}
.endif

USES=		tar:bzip2
HAS_CONFIGURE=	yes
CONFIGURE_SCRIPT=	Configure
CONFIGURE_ARGS=	-n freebsd
CONFIGURE_ENV=	LSOF_CC="${CC}"  LSOF_VERS=7042 FREEBSD_SYS="${SRC_BASE}/sys" LSOF_VSTR="9.1-RELEASE"

.if !exists(${SRC_BASE}/sys/kern/kern_lockf.c)
IGNORE=		requires kernel sources
.endif

.if !defined(FIXUP_RELEASE)
post-extract:
	@( cd ${WRKDIR}/${DISTNAME} ; \
	EXPMD5=`${SED} -n 's/^[[:blank:]]*\(MD5*=*\)/\1/p' README.${DISTNAME}` ; \
	CALCMD5=`${MD5} ${SRCBALL_NAME}.tar` ; \
	if [ "$${EXPMD5}"X != "$${CALCMD5}"X ]; then \
		${ECHO} "Expected and calculated MD5 signatures don't agree." ; \
		${ECHO} "($$EXPMD5 != $$CALCMD5)" ; \
		exit 1 ; \
	fi ; \
	${CAT} ${SRCBALL_NAME}.tar ${EXTRACT_AFTER_ARGS} \
	)
	@( cd ${WRKSRC} ; ${ECHO_CMD} "y" | ./Inventory || exit 1 )
.endif

do-install:
	${INSTALL} ${COPY} ${STRIP} -o ${BINOWN} -m 2755 -g kmem ${WRKSRC}/lsof ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/lsof.8 ${MAN8PREFIX}/man/man8/lsof.8
	@${MKDIR} ${PREFIX}/share/lsof
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/* ${PREFIX}/share/lsof
	@${CHMOD} 0444 ${PREFIX}/share/lsof/00*

post-install:
	cd ${PREFIX} && \
	    ${FIND} -s share/lsof -type f -o -type l >>${TMPPLIST} ;\
	    ${FIND} -d share/lsof -type d \
	        | ${SED} -e 's/^/@dirrm /g' >>${TMPPLIST}

.include <bsd.port.mk>
