# $MidnightBSD$

PORTNAME=	enlightenment
DISTVERSION=	1.0.0
CATEGORIES=	x11-wm
MASTER_SITES=	SF/enlightenment
DISTNAME=	e16-${DISTVERSION}

MAINTAINER=	ports@MdinightBSD.org
COMMENT=	A very artistic X window manager
LICENSE=	mit

E16_REVISION=	000
DATADIR=	${PREFIX}/share/e16
DOCSDIR=	${PREFIX}/share/doc/e16

LIB_DEPENDS+=	Imlib2.5:${PORTSDIR}/graphics/imlib2

USE_XORG=	compositeproto damageproto xextproto x11 xbitmaps xcomposite xdamage \
		xext xfixes xft xinerama xrandr xrender xxf86vm
USE_ICONV=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-esdtest --disable-dependency-tracking \
		--disable-rpath

.if !defined(WITHOUT_ESOUND)
USE_GNOME=	esound
.else
CONFIGURE_ARGS+=--disable-sound
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if !defined(NOPORTDOCS)
BUILD_DEPENDS+=	xmlto:${PORTSDIR}/textproc/xmlto
CONFIGURE_ARGS+=--enable-docs=yes
.else
CONFIGURE_ARGS+=--enable-docs=no
post-patch:
	${REINPLACE_CMD} -e '/^SUBDIRS/s|docs ||' \
	    ${WRKSRC}/Makefile.am ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
