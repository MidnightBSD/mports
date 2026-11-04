PORTNAME=	libast
PORTVERSION=	0.7
PORTREVISION=	16
CATEGORIES=	devel
MASTER_SITES=	http://www.eterm.org/download/ \
		FREEBSD_LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of assorted spiffy things

LICENSE=	mit

LIB_DEPENDS=	libpcre.so:devel/pcre \
		libImlib2.so:graphics/imlib2

GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		cpe libtool pathfix

.if defined(MACHINE_CPU) && ${MACHINE_CPU:Mmmx}
CONFIGURE_ARGS+=--enable-mmx
.endif

.include <bsd.port.mk>
