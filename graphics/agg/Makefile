PORTNAME=	agg
PORTVERSION=	2.5
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://distfiles.alpinelinux.org/distfiles/ \
		http://distfiles.lesslinux.org/ \
		http://gentoo.netnitco.net/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High Quality Rendering Engine for C++

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/copying

LIB_DEPENDS=	libfreetype.so:print/freetype2

GNU_CONFIGURE=	yes
USES=		autoreconf cpe gmake libtool pathfix pkgconfig sdl xorg
USE_XORG=	x11
USE_SDL=	sdl
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CPE_VENDOR=	antigrain

post-patch:
	@${REINPLACE_CMD} 's/_LDFLAGS/_LDADD/' ${WRKSRC}/examples/Makefile.am

.include <bsd.port.mk>
