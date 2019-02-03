# $MidnightBSD$

PORTNAME=	libstreams
PORTVERSION=	${STRIGI_VERSION}
PORTREVISION=	1
CATEGORIES=	deskutils
MASTER_SITES=	${STRIGI_MASTER_SITES}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Strigi desktop search: streams library

LICENSE=	gpl2

USES=		iconv tar:bzip2
USE_LDCONFIG=	yes

post-patch:
	${REINPLACE_CMD} -e \
		's,$${LIB_DESTINATION}/pkgconfig,libdata/pkgconfig,' \
		${WRKSRC}/libstreams/CMakeLists.txt

.include <${.CURDIR}/../strigi/Makefile.common>
.include <bsd.port.mk>
