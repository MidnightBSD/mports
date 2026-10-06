PORTNAME=	libmspack
DISTVERSION=	0.11alpha
CATEGORIES=	archivers
MASTER_SITES=	http://www.cabextract.org.uk/libmspack/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for Microsoft compression formats

LICENSE=	lgpl2.1

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		cpe libtool pathfix
CPE_VENDOR=	libmspack_project
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} 's,-Wno-unused-result,,' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
