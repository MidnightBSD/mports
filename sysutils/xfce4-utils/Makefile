# New ports collection makefile for:	libxfce4util
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/sysutils/xfce4-utils/Makefile,v 1.3 2011/02/09 13:24:34 laffer1 Exp $
# $FreeBSD: ports/sysutils/xfce4-utils/Makefile,v 1.42 2008/06/06 14:03:25 edwin Exp $
#

PORTNAME=	xfce4-utils
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	sysutils xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	xfce-utils-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 essential utilities and scripts
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 intltool intlhack pkgconfig
USE_XFCE=	configenv libgui libutil panel
CONFIGURE_ARGS+=--with-xsession-prefix=${PREFIX} \
		--disable-debug

OPTIONS=	DBUS	"Enable D-BUS support"			on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_DBUS)
LIB_DEPENDS+=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
CONFIGURE_ARGS+=--enable-dbus
PLIST_SUB+=	WITH_DBUS=""
.else
CONFIGURE_ARGS+=--disable-dbus
PLIST_SUB+=	WITH_DBUS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} 's|/usr/local/share:|${LOCALBASE}/share:|' \
		${WRKSRC}/scripts/startxfce4.in
	@${REINPLACE_CMD} 's|/usr/local/share:||' \
		${WRKSRC}/scripts/startxfce4.in

.include <bsd.port.post.mk>
