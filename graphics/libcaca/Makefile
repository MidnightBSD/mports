# New ports collection makefile for:   libcaca
# Date created:			11 January 2004
# Whom:				Vincent Tantardini <vinc@FreeBSD-fr.org>
#
# $MidnightBSD: mports/graphics/libcaca/Makefile,v 1.6 2011/02/02 21:04:18 laffer1 Exp $
#

PORTNAME=	libcaca
DISTVERSION=	0.99.beta13
CATEGORIES=	graphics
MASTER_SITES=	http://libcaca.zoy.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphics library that outputs text instead of pixels
LICENSE=	unknown
# this guy has his own license, gpl and lgpl stuff... ?

USE_GNOME=	gnomehack  ltverhack pkgconfig
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -lm -lncurses"
CONFIGURE_ARGS=	--disable-doc \
		--enable-ncurses \
		--disable-csharp \
		--disable-ruby
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

DOCS=		AUTHORS COPYING COPYING.GPL COPYING.LGPL ChangeLog NEWS \
		NOTES README THANKS TODO
MAN1=		caca-config.1 cacafire.1 cacaplay.1 cacaserver.1 cacaview.1 \
		img2txt.1

.if defined(WITHOUT_X11)
CONFIGURE_ARGS+=--disable-x11
.else
USE_XORG=	x11
.endif

.if defined(WITHOUT_IMLIB2)
CONFIGURE_ARGS+=--disable-imlib2
.else
LIB_DEPENDS+=	Imlib2.5:${PORTSDIR}/graphics/imlib2
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_SLANG)
LIB_DEPENDS+=	slang.2:${PORTSDIR}/devel/libslang2
CONFIGURE_ARGS+=--enable-slang
.else
CONFIGURE_ARGS+=--disable-slang
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-g -O2 ||g ; s| -fomit-frame-pointer||g ; \
		s|arpa\/inet.h ||g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|: install-docDATA|:|g' \
		${WRKSRC}/Makefile.in

.ifndef (NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
