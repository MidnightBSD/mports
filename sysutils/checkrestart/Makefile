PORTNAME=	checkrestart
DISTVERSIONPREFIX=	v
DISTVERSION=	0.5.0
PORTREVISION=	1
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find processes that need restarting after an upgrade

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USE_GITHUB=	yes
GH_ACCOUNT=	Freaky

SUB_FILES=	checkrestart

PLIST_FILES=	bin/checkrestart \
		share/man/man1/checkrestart.1.gz \
		${PERIODIC_SECURITY}/checkrestart

PERIODIC_SECURITY=	etc/periodic/security/

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/checkrestart ${STAGEDIR}${PREFIX}/bin
	${MKDIR} ${MAN1PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/checkrestart.1 ${STAGEDIR}${MAN1PREFIX}/share/man/man1
	@${MKDIR} ${STAGEDIR}${PREFIX}/${PERIODIC_SECURITY}
	${INSTALL_SCRIPT} ${WRKDIR}/checkrestart ${STAGEDIR}${PREFIX}/${PERIODIC_SECURITY}

.include <bsd.port.mk>
