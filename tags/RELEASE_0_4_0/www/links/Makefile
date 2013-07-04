# $MidnightBSD: mports/www/links/Makefile,v 1.13 2012/09/09 02:09:35 laffer1 Exp $

PORTNAME=	links
DISTVERSION=	2.7
PORTEPOCH=	1
CATEGORIES=	www ipv6
MASTER_SITES=	http://links.twibright.com/download/ LOCAL/bf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lynx-like text WWW browser
LICENSE=	gpl2

CONFLICTS=	links-0*

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--with-ssl --without-pmshell --without-atheos \
			--without-gpm --without-fb --without-windows
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

USE_OPENSSL=	yes
USE_BZIP2=	yes

DESKTOP_ENTRIES="links" \
		"Lynx-like text WWW browser" \
		"${DATADIR}/links.xpm" \
		"links -g" \
		"Application;Network;WebBrowser;" \
		${FALSE}

OPTIONS=	SVGALIB "non-X11 graphics support" off \
		X11 "X11 graphics support" on \
		TRANS "Hack for background transparency" off

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4015
LIB_DEPENDS+= lzma:${PORTSDIR}/archivers/xz
.endif

.ifdef(WITH_SVGALIB) || defined(WITH_X11) || defined(WITH_DIRECTFB)
LIB_DEPENDS+=	png15:${PORTSDIR}/graphics/png \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		tiff.4:${PORTSDIR}/graphics/tiff
CONFIGURE_ARGS+=	--enable-graphics
.else
CONFIGURE_ARGS+=	--disable-graphics --without-libjpeg --without-libtiff
.endif

.ifdef(WITH_SVGALIB)
LIB_DEPENDS+=	vga.1:${PORTSDIR}/graphics/svgalib
CONFIGURE_ARGS+=	--with-svgalib
.else
CONFIGURE_ARGS+=	--without-svgalib
.endif

CONFIGURE_ARGS+=	--without-directfb

.if !defined(WITHOUT_X11)
USE_XORG=	x11 xproto
CONFIGURE_ARGS+=	--with-x
.else
CONFIGURE_ARGS+=	--without-x
.endif

.if defined(WITH_TRANS)
EXTRA_PATCHES+=		${FILESDIR}/extra-terminal.c.diff
.endif

MAN1=		links.1
PLIST_FILES=	bin/links

post-patch:
	@${REINPLACE_CMD} -e "s!/etc/!${PREFIX}/etc/!" ${WRKSRC}/os_dep.h

.include <bsd.port.post.mk>
