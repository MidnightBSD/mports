PORTNAME=	xwallpaper
DISTVERSION=	0.7.4
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	https://github.com/stoeckmann/xwallpaper/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xwallpaper utility allows you to set image files as your X wallpaper
WWW=		https://github.com/stoeckmann/xwallpaper

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libpixman-1.so:x11/pixman \
		libxcb-image.so:x11/xcb-util-image \
		libxcb-util.so:x11/xcb-util

USES=		autoreconf jpeg pkgconfig xorg tar:xz
USE_XORG=	x11
GNU_CONFIGURE=	yes

PLIST_FILES=bin/xwallpaper \
			share/man/man1/xwallpaper.1.gz \
			share/zsh/site-functions/_xwallpaper

.include <bsd.port.mk>
