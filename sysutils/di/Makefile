PORTNAME=	di
PORTVERSION=	4.52
CATEGORIES=	sysutils
MASTER_SITES=	SF/diskinfo-di

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Disk Information Utility
WWW=		https://diskinfo-di.sourceforge.io/

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

MAKE_ARGS=	-e
MAKE_ENV=	prefix="${TRUE_PREFIX}"

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext
NLS_MAKE_ENV_OFF=	DI_NO_NLS=T

pre-install:
	@${STRIP_CMD} ${WRKSRC}/C/di

.include <bsd.port.mk>
