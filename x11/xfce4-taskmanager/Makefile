PORTNAME=	xfce4-taskmanager
PORTVERSION=	1.5.7
PORTREVISION=	1
CATEGORIES=	x11 xfce
MASTER_SITES=	XFCE/apps
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Task manager for the Xfce desktop
WWW=		https://goodies.xfce.org/projects/applications/xfce4-taskmanager

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libharfbuzz.so:print/harfbuzz

USES=		gettext-tools gmake gnome localbase pkgconfig tar:bzip2 xfce \
		xorg
USE_GNOME=	cairo gdkpixbuf glib20 gtk30 intltool libwnck3
USE_XFCE=	libmenu xfconf
USE_XORG=	ice sm x11 xmu xt

GNU_CONFIGURE=	yes

CONFIGURE_ARGS+=	--disable-silent-rules --disable-gksu --enable-wnck3
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=		gettext-runtime
NLS_CONFIGURE_ENABLE=	nls

.include <bsd.port.mk>
