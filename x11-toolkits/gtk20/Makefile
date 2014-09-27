# $MidnightBSD$

PORTNAME=	gtk
PORTVERSION=	2.24.22
PORTREVISION?=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gtk+/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	gtk+-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gimp Toolkit for X11 GUI (previous stable version)

LICENSE=	lgpl

USES=		tar:xz

.if !defined(REFERENCE_PORT)

RUN_DEPENDS+=	${LOCALBASE}/share/mime/magic:${PORTSDIR}/misc/shared-mime-info \
		${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

USE_PERL5_BUILD=yes
USE_PYTHON=	2.5-2.7
USE_LDCONFIG=	yes
USE_GNOME=	atk pango gdkpixbuf2 gtk-update-icon-cache introspection:build
USES+=		gettext gmake libtool:keepla pathfix pkgconfig
USE_XORG=	xext xrender x11 xinerama xi xrandr xcursor xfixes xdamage \
		xcomposite xau xdmcp xproto
CONFIGURE_ARGS=	--with-xinput=yes
CPPFLAGS+=	-I${LOCALBASE}/include/freetype2 \
		-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	CUPS DEBUG
OPTIONS_DEFAULT=CUPS

CUPS_LIB_DEPENDS=	libcups.so:${PORTSDIR}/print/cups-client
CUPS_CONFIGURE_ON=	--enable-cups=auto
CUPS_CONFIGURE_OFF=	--disable-cups
DEBUG_CONFIGURE_ON=	--enable-debug=yes

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${GREP} -l lgmodule | \
		${XARGS} ${REINPLACE_CMD} -e 's|-lgmodule|@GMODULE_LIBS@|g'
	@${REINPLACE_CMD} -e 's|[{]libdir[}]/locale|{datadir}/locale|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|@LN_S@|${LN} -sf|' ${WRKSRC}/gtk/Makefile.in
	@${REINPLACE_CMD} -e 's|file,cups|file,cups,lpr|' \
		${WRKSRC}/gtk/Makefile.in

pre-configure:
.if !exists(${LOCALBASE}/libdata/pkgconfig/cairo-xlib.pc)
	@${ECHO_CMD} "${PKGNAME}: Needs cairo with X11 support enabled."
	@${FALSE}
.endif

pre-build:
	@${RM} -rf ${WRKSRC}/docs/gtk.info*

post-install:
#-@${FIND} ${LOCALBASE}/share/icons -type d -depth 1 -exec \
#		${PREFIX}/bin/gtk-update-icon-cache -q -f {} \; 2>/dev/null
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/modules
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK2_VERSION}/engines
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK2_VERSION}/loaders
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK2_VERSION}/modules
	${INSTALL_MAN} ${MAN1:S|^|${WRKSRC}/docs/reference/gtk/|} \
		${PREFIX}/man/man1

.include <bsd.port.mk>

.endif
