# $MidnightBSD: mports/x11-wm/xfce4-panel/Makefile,v 1.5 2011/02/09 13:25:21 laffer1 Exp $
# $FreeBSD: ports/x11-wm/xfce4-panel/Makefile,v 1.46 2008/06/06 14:17:21 edwin Exp $

PORTNAME=	xfce4-panel
PORTVERSION=	4.6.4
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 panel module
LICENSE=	lgpl

LIB_DEPENDS=	wnck-1.22:${PORTSDIR}/x11-toolkits/libwnck \
		cairo.2:${PORTSDIR}/graphics/cairo

CONFLICTS=	xfce4-systray-*
GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack  gtk20 intltool intlhack pkgconfig
USE_LDCONFIG=	yes
USE_PERL5=	yes
USE_XFCE=	configenv libexo libgui libutil
USE_XORG=	x11 sm

CONFIGURE_ARGS=	--enable-gtk-doc-html=no \
		--disable-debug

OPTIONS=	GTKDOC	"install the library documentation"	off \
		STARTUP "Enable startup notification support"	on \
		NLS	"Enable Native Language Support" 	on

.include <bsd.port.pre.mk>

.if defined(WITH_GTKDOC)
BUILD_DEPENDS+=	gtkdocize:${PORTSDIR}/textproc/gtk-doc
CONFIGURE_ARGS+=--enable-gtk-doc
PLIST_SUB+=	GTK_DOC=""
.else
CONFIGURE_ARGS+=--disable-gtk-doc
PLIST_SUB+=	GTK_DOC="@comment "
.endif

.if !defined(WITHOUT_STARTUP)
LIB_DEPENDS+=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification
CONFIGURE_ARGS+=--enable-startup-notification
.else
CONFIGURE_ARGS+=--disable-startup-notification
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's| manual||g' ${WRKSRC}/docs/Makefile.in

.include <bsd.port.post.mk>
