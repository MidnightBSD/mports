# $MidnightBSD: mports/x11-toolkits/libwnck/Makefile,v 1.10 2011/05/14 22:46:11 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/libwnck/Makefile,v 1.53 2007/07/03 16:51:41 mezz Exp $

PORTNAME=	libwnck
PORTVERSION=	2.30.6
PORTREVISION?=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library used for writing pagers and taskslists
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
RUN_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection

USE_GETTEXT=	yes
USE_XORG=	xres
USE_GMAKE=	yes
USE_GNOME=	gnomehack gtk20 ltverhack referencehack intlhack
USE_BISON=	build
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	STARTUP
OPTIONS_DEFAULT=STARTUP
STARTUP_DESC=	Startup notification support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSTARTUP}
LIB_DEPENDS+=	startup-notification-1:${PORTSDIR}/x11/startup-notification
CONFIGURE_ARGS+=--enable-startup-notification
.else
CONFIGURE_ARGS+=--disable-startup-notification
.endif

.include <bsd.port.mk>

.endif
