PORTNAME=	dmidecode
PORTVERSION=	3.3
CATEGORIES=	sysutils
MASTER_SITES=	SAVANNAH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for dumping DMI (SMBIOS) contents in human-readable format

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

ONLY_FOR_ARCHS=	amd64 i386

USES=		tar:xz

SUB_FILES=	dmidecode

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/periodic/daily/
	${INSTALL_SCRIPT} ${WRKDIR}/dmidecode ${STAGEDIR}${PREFIX}/etc/periodic/daily/

.include <bsd.port.mk>
