PORTNAME=	di
PORTVERSION=	4.47.1
CATEGORIES=	sysutils
MASTER_SITES=	https://gentoo.com/di/ \
		http://www.cyberbotx.com/di/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Disk Information Utility

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/LICENSE

MAKE_ENV=	prefix="${PREFIX}"
MAKE_ARGS=	-e

post-patch:
	@${REINPLACE_CMD} -e "s|zoneid_t|zoneId_t|g" ${WRKSRC}/C/di.c

pre-install:
	@${STRIP_CMD} ${WRKSRC}/C/di

.include <bsd.port.mk>
