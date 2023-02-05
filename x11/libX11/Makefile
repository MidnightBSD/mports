PORTNAME=	libX11
DISTVERSION=	1.8.4
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	x11
DISTFILES=	${DISTNAME}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 library
WWW=		https://www.freedesktop.org/Software/xlibs

LICENSE=	mit

USES=		cpe xorg xorg-cat:lib tar:xz
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
	@${REINPLACE_CMD} '/^install-data-am:/,/^$$/ \
		s/install-specDATA//' ${WRKSRC}/nls/Makefile.in

.include <bsd.port.mk>
