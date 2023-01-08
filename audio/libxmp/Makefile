PORTNAME=	libxmp
PORTVERSION=	4.5.0
CATEGORIES=	audio
MASTER_SITES=	SF/xmp/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module rendering library for xmp
WWW=		http://xmp.sourceforge.net/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/docs/COPYING.LIB

USES=		gmake pathfix
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

PLIST_FILES=	include/xmp.h \
		lib/libxmp.so \
		lib/libxmp.so.${PORTVERSION} \
		lib/libxmp.so.4 \
		libdata/pkgconfig/libxmp.pc

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libxmp.so.${PORTVERSION}
	${CP} ${WRKSRC}/libxmp.pc ${PREFIX}/libdata/pkgconfig/libxmp.pc

.include <bsd.port.mk>
