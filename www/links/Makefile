PORTNAME=	links
DISTVERSION=	2.29
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	http://links.twibright.com/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lynx-like text WWW browser
WWW=		http://links.twibright.com/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

CONFLICTS=	links-0* links-hacked-[0-9]* links1-[0-9]*

LIB_DEPENDS=	libzstd.so:archivers/zstd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ssl --without-pmshell --without-atheos \
		--without-gpm --without-fb --without-windows

USES=		cpe localbase:ldflags ssl gettext-runtime tar:bzip2

CPE_VENDOR=	twibright

PLIST_FILES=	bin/links share/man/man1/links.1.gz

OPTIONS_DEFINE=	BROTLI CIPHERSTRING DIRECTFB IPV6 SVG SVGALIB THREADS TRANS \
		UTF8 X11
OPTIONS_DEFAULT=	UTF8 X11

BROTLI_LIB_DEPENDS=	libbrotlidec.so:archivers/brotli
BROTLI_CONFIGURE_WITH=	brotli

CIPHERSTRING_DESC=	Select the OpenSSL ciphers used via CIPHERSTRING
DIRECTFB_DESC=		DirectFB graphics support
TRANS_DESC=		Hack for background transparency

DIRECTFB_LIB_DEPENDS=	libdirectfb.so:devel/directfb
DIRECTFB_CONFIGURE_WITH=directfb

IPV6_CONFIGURE_WITH=	ipv6

SVG_CONFIGURE_WITH=	librsvg
SVG_USES=		gnome
SVG_USE=		gnome=librsvg2,glib20,gdkpixbuf,cairo

SVGALIB_LIB_DEPENDS=	libvga.so:graphics/svgalib
SVGALIB_CONFIGURE_WITH=	svgalib

THREADS_CFLAGS=	-DHAVE_PTHREADS
THREADS_LDFLAGS=-pthread

TRANS_EXTRA_PATCHES=	${FILESDIR}/extra-terminal.c.diff

UTF8_CONFIGURE_ENABLE=	utf8

X11_USES=		xorg
X11_USE=		xorg=x11,xorgproto
X11_LIB_DEPENDS=	libevent.so:devel/libevent \
			libfontconfig.so:x11-fonts/fontconfig \
			libfreetype.so:print/freetype2
X11_CONFIGURE_WITH=	x
X11_PLIST_FILES=	share/pixmaps/links.xpm

.include <bsd.mport.options.mk>

#CIPHERSTRING must be a valid OpenSSL cipher string(see ciphers(1)):
CIPHERSTRING?=	HIGH:!SSLv2:!aNULL:!eNULL:@STRENGTH

.if ${PORT_OPTIONS:MDIRECTFB} || ${PORT_OPTIONS:MSVGALIB} || ${PORT_OPTIONS:MX11}
LIB_DEPENDS+=	libavif.so:graphics/libavif \
		libpng.so:graphics/png \
		libtiff.so:graphics/tiff \
		libwebp.so:graphics/webp
USES+=		jpeg pkgconfig
CONFIGURE_ARGS+=	--enable-graphics
.else
.if ${PORT_OPTIONS:MSVG}
IGNORE=	option SVG requires one of DIRECTFB, SVGALIB, or X11
.endif
CONFIGURE_ARGS+=	--disable-graphics --without-libavif \
			--without-libjpeg \
			--without-librsvg --without-libtiff \
			--without-libwebp
.endif

.if ${PORT_OPTIONS:MX11}
DESKTOP_ENTRIES="links" \
		"Lynx-like text WWW browser" \
		"${PREFIX}/share/pixmaps/links.xpm" \
		"links -g" \
		"Network;WebBrowser;" \
		false
.endif

post-patch:
	@${REINPLACE_CMD} -e "s!/etc/!${PREFIX}/etc/!" ${WRKSRC}/os_dep.h
	@${REINPLACE_CMD} -e "/LIBS=/{s/-lpthread/-pthread/;s/-ldl//;}" \
		${WRKSRC}/configure
.if ${PORT_OPTIONS:MCIPHERSTRING}
	@${REINPLACE_CMD} -e '/SSL_CTX_set_options/ \
	s/;/; SSL_CTX_set_cipher_list(ctx, "${CIPHERSTRING}");/' \
		${WRKSRC}/https.c
.endif

.if ${PORT_OPTIONS:MX11}
post-install:
	@${INSTALL_DATA} ${WRKSRC}/graphics/links.xpm ${STAGEDIR}${PREFIX}/share/pixmaps/links.xpm
.endif

.include <bsd.port.mk>
