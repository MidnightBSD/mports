# $MidnightBSD$

PORTNAME=	zlib
PORTVERSION=	1.2.6
CATEGORIES=	archivers
MASTER_SITES=	SF/libpng/${PORTNAME}/${PORTVERSION} \
		http://zlib.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Massively Spiffy Yet Delicately Unobtrusive Compression Library
LICENSE=	other

USE_BZIP2=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX}
HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes

MAN3=		zlib.3
NO_MANCOMPRESS=	yes

PLIST_FILES=	include/zconf.h \
		include/zlib.h \
		lib/libz.so \
		lib/libz.a \
		lib/libz.so.1 \
		lib/libz.so.1.2.6 \
		lib/pkgconfig/zlib.pc
PLIST_DIRS=	lib/pkgconfig

post-patch:
	@${REINPLACE_CMD} -e '/mandir/s/share\///' ${WRKSRC}/configure

.include <bsd.port.mk>
