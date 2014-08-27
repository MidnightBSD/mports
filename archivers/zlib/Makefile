# $MidnightBSD$

PORTNAME=	zlib
PORTVERSION=	1.2.7
CATEGORIES=	archivers
MASTER_SITES=	SF/libpng/${PORTNAME}/${PORTVERSION} \
		http://zlib.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Massively Spiffy Yet Delicately Unobtrusive Compression Library

LICENSE=	other

USES=		tar:bzip2
CONFIGURE_ARGS=	--prefix=${PREFIX}
HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e '/mandir/s/share\///' ${WRKSRC}/configure

.include <bsd.port.mk>
