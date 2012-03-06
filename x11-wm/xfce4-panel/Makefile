# $MidnightBSD: mports/x11-wm/xfce4-panel/Makefile,v 1.6 2011/12/15 00:57:58 laffer1 Exp $
# $FreeBSD: ports/x11-wm/xfce4-panel/Makefile,v 1.46 2008/06/06 14:17:21 edwin Exp $

PORTNAME=	xfce4-panel
PORTVERSION=	4.8.6
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=src/xfce/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 panel module
LICENSE=	lgpl

LIB_DEPENDS=	wnck-1.22:${PORTSDIR}/x11-toolkits/libwnck \
		cairo.2:${PORTSDIR}/graphics/cairo \
		dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

CONFLICTS=	xfce4-systray-*
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20 gtk20 intltool intlhack pkgconfig \
		desktopfileutils
USE_LDCONFIG=	yes
USE_PERL5=	yes
USE_XFCE=	configenv garcon libexo libmenu libutil xfconf
USE_XORG=	x11 sm

CONFIGURE_ENV+=	ac_cv_prog_AWK="${AWK}"

OPTIONS=	NLS	"Enable Native Language Support" 	on \
		APIDOCS	"Install api documentation"		off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if defined(WITHOUT_APIDOCS)
CONFIGURE_ARGS+=--without-html-dir
PLIST_SUB+=	APIDOCS="@comment "
.else
CONFIGURE_ARGS+=--with-html-dir=${PREFIX}/share/gtk-doc/html
PLIST_SUB+=	APIDOCS=""
.endif

.include <bsd.port.post.mk>
