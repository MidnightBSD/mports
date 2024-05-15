PORTNAME=	libX11
DISTVERSION=	1.8.9
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 library
WWW=		https://www.freedesktop.org/Software/xlibs

LICENSE=	mit

USES=		cpe tar:xz xorg xorg-cat:lib
USE_XORG=	xau xdmcp xtrans xorgproto xcb
CPE_VENDOR=	x

CONFIGURE_ARGS+=	--datadir=${PREFIX}/lib \
			--without-xmlto \
			--with-perl=no \
			--disable-specs
CONFIGURE_ENV+=	ac_cv_path_PS2PDF=""
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} 's/test.*-traditional.*;/true;/' \
		${WRKSRC}/configure

.include <bsd.port.mk>
