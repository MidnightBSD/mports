PORTNAME=	rar
PORTVERSION=	6.0.2
PORTEPOCH=	3
CATEGORIES=	archivers
MASTER_SITES=	https://rarlab.com/rar/
DISTNAME=	rarbsd${ARCH:S|amd64|-x64|:S|i386||}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File archiver (binary port)

LICENSE=	RAR
LICENSE_NAME=	RAR license
LICENSE_FILE=	${WRKSRC}/license.txt
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

ONLY_FOR_ARCHS=	amd64 i386

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/rar

PLIST_FILES=	bin/rar etc/rarfiles.lst lib/default.sfx man/cat1/rar.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rar ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/rarfiles.lst ${STAGEDIR}${PREFIX}/etc
	${INSTALL_DATA} ${WRKSRC}/default.sfx ${STAGEDIR}${PREFIX}/lib
	${INSTALL_MAN} ${WRKSRC}/rar.txt ${STAGEDIR}${PREFIX}/man/cat1/rar.1

# maintainer section:

.if defined(MAINTAINER_MODE)
DISTFILES=	rarbsd-${PORTVERSION}.tar.gz \
		rarbsd-x64-${PORTVERSION}.tar.gz
.endif

.include <bsd.port.mk>
