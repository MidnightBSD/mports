# $MidnightBSD$

PORTNAME=	celt
PORTVERSION=	0.11.3
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	http://downloads.us.xiph.org/releases/celt/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The CELT ultra-low delay audio codec

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libogg.so:${PORTSDIR}/audio/libogg

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ogg=${LOCALBASE}
USE_LDCONFIG=	yes
USES=		gmake libtool:keepla pathfix
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
