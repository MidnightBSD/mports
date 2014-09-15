# $MidnightBSD$

PORTNAME=	xfce4-appfinder
PORTVERSION=	4.10.1
CATEGORIES=	misc xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/xfce/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find application in the system supporting Desktop entry format

LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1:${PORTSDIR}/devel/dbus-glib

GNU_CONFIGURE=	yes
USES=		gmake pathfix pkgconfig tar:bzip2
USE_GNOME=	gtk20 glib20 intltool intlhack
USE_XFCE=	configenv garcon libmenu libutil xfconf

OPTIONS_DEFINE=	NLS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=	gettext
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.mk>
