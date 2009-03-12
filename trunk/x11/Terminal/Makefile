# New ports collection makefile for:	Terminal
# Date created:		23 October 2004
# Whom:			Matt Lancereau <ports@FreeBSD.org>
#
# $MidnightBSD: mports/x11/Terminal/Makefile,v 1.2 2008/12/24 19:01:45 ctriv Exp $
# $FreeBSD: ports/x11/Terminal/Makefile,v 1.19 2008/06/06 14:08:50 edwin Exp $
#

PORTNAME=	Terminal
PORTVERSION=	0.2.10
CATEGORIES=	x11 xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal emulator for the X windowing system
LICENSE=	gpl2

LIB_DEPENDS=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 intltool intlhack pkgconfig vte
USE_XFCE=	configenv libexo

OPTIONS=	DBUS	"Enable D-BUS support"			on \
		STARTUP "Enable startup notification support"	on

MAN1=		Terminal.1

.include  <bsd.port.pre.mk>

.if !defined(WITHOUT_DBUS)
LIB_DEPENDS+=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
CONFIGURE_ARGS+=--enable-dbus
PLIST_SUB+=	WITH_DBUS=""
.else
CONFIGURE_ARGS+=--disable-dbus
PLIST_SUB+=	WITH_DBUS="@comment "
.endif

.if !defined(WITHOUT_STARTUP)
LIB_DEPENDS+=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification
CONFIGURE_ARGS+=--enable-startup-notification
.else
CONFIGURE_ARGS+=--disable-startup-notification
.endif

post-patch:
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e 's|	doc[    ]*||' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.post.mk>
