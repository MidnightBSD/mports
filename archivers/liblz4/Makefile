PORTNAME=	lz4
PORTVERSION=	1.9.2
DISTVERSIONPREFIX=	v
PORTEPOCH=	1
CATEGORIES=	archivers
PKGNAMEPREFIX=	lib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LZ4 compression library, lossless and very fast

LICENSE=	bsd2 gpl2
LICENSE_COMB=	multi

USES=		gmake pkgconfig
USE_GITHUB=	yes
USE_LDCONFIG=	yes
MAKE_ARGS=	PREFIX="${PREFIX}" \
		INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		MANDIR="${MAN1PREFIX}/man"

PLIST_SUB=	PORTVERSION=${PORTVERSION}

post-extract:
	${REINPLACE_CMD} -e 's|DragonFly|MidnightBSD|g' \
		${WRKSRC}/lib/Makefile

.include <bsd.port.mk>
