# $MidnightBSD$

PORTNAME=	data
PORTVERSION=	0.6
PORTREVISION=	2
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.SpringDaemons.com/soft/
PKGNAMEPREFIX=	devcpu-
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Intel and AMD CPUs microcode updates

LICENSE=	unknown

USES=		tar:bzip2
NO_BUILD=	yes

ONLY_FOR_ARCHS=	i386 amd64

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 4014
DATADIR=	${PREFIX}/share/cpucontrol
.else
DATADIR=	${PREFIX}/share/devcpu
.endif

USE_RC_SUBR=	microcode_update

do-install:
	${MKDIR} ${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/mcodes/* ${DATADIR}/
	@${TOUCH} ${DATADIR}/.do_not_delete

post-install:
	@${FIND} -ds ${DATADIR}/ ! -type d | \
		${SED} 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${ECHO_CMD} "@unexec rmdir %D/${DATADIR:S,^${PREFIX},,}" >> ${TMPPLIST}

.include <bsd.port.post.mk>
