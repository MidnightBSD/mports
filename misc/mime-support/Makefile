PORTNAME=	mime-support
PORTVERSION=	3.61
CATEGORIES=	misc
MASTER_SITES=	DEBIAN_POOL
DISTNAME=	${PORTNAME}_${PORTVERSION:C/([0-9]*\.[0-9]*)\.(.*)/\1-\2/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MIME Media Types list

LICENSE=	publicdom

USES=		cpe shebangfix

CPE_VENDOR=	debian

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

NO_BUILD=	yes
PLIST_FILES=	bin/run-mailcap etc/mime.types \
		man/man1/run-mailcap.1.gz

SHEBANG_FILES=	run-mailcap

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/run-mailcap ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/mime.types ${PREFIX}/etc
	${INSTALL_MAN} ${WRKSRC}/run-mailcap.man ${MANPREFIX}/man/man1/run-mailcap.1

.include <bsd.port.mk>
