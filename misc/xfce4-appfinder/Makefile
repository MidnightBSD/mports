PORTNAME=	xfce4-appfinder
PORTVERSION=	4.18.1
PORTREVISION=	1
CATEGORIES=	misc xfce
MASTER_SITES=	XFCE
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Application launcher and finder

LICENSE=	gpl2

USES=		compiler:c11 gettext-tools gmake gnome pkgconfig tar:bzip2 xfce
USE_GNOME=	cairo gdkpixbuf glib20 gtk30 intltool
USE_XFCE=	garcon xfconf

GNU_CONFIGURE=	yes

PORTSCOUT=	limitw:1,even

OPTIONS_DEFINE=		NLS
OPTIONS_SUB=		yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext-runtime

.include <bsd.port.mk>
