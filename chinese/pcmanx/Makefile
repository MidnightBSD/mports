PORTNAME=	pcmanx
PORTVERSION=	1.3
PORTREVISION=	4
CATEGORIES=	chinese net gnome
MASTER_SITES=	https://github.com/pcman-bbs/${PORTNAME}/releases/download/${PORTVERSION}/
DISTNAME=	${PORTNAME}-gtk2-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BBS client using GTK 2.x
WWW=		https://github.com/pcman-bbs/pcmanx

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c++11-lang gmake gnome iconv pkgconfig tar:xz

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
USE_GNOME=	gtk20 intlhack

OPTIONS_DEFINE=	NLS DEBUG DOCKLET NOTIFIER LIBNOTIFY NANCY MOUSE EXTERNAL IPLOOKUP PROXY
OPTIONS_DEFAULT=	DOCKLET NOTIFIER NANCY MOUSE EXTERNAL
OPTIONS_SUB=	yes

DOCKLET_DESC=	Docklet / system tray support
NOTIFIER_DESC=	Popup notifier support
LIBNOTIFY_DESC=	Popup notifier support by libnotify
NANCY_DESC=	Nancy bot support
MOUSE_DESC=	Mouse click and wheel support
EXTERNAL_DESC=	External SSH/Telnet support
IPLOOKUP_DESC=	IP location lookup support

NLS_USES=		gettext
NLS_USES_OFF=	gettext-tools
NLS_CPPFLAGS=	-I${LOCALBASE}/include
NLS_LDFLAGS=	-L${LOCALBASE}/lib
NLS_CONFIGURE_ENABLE=nls

DEBUG_CONFIGURE_ENABLE=		debug
DOCKLET_CONFIGURE_ENABLE=	docklet
NOTIFIER_CONFIGURE_ENABLE=	notifier
LIBNOTIFY_CONFIGURE_ENABLE=	libnotify
LIBNOTIFY_LIB_DEPENDS=		libnotify.so:devel/libnotify
NANCY_CONFIGURE_ENABLE=		nancy
MOUSE_CONFIGURE_ENABLE=		mouse
EXTERNAL_CONFIGURE_ENABLE=	external
IPLOOKUP_CONFIGURE_ENABLE=	iplookup
PROXY_CONFIGURE_ENABLE=		proxy

post-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/script/

.include <bsd.port.mk>
