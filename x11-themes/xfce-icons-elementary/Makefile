PORTNAME=	elementary
PORTVERSION=	0.19
DISTVERSIONPREFIX=v
PORTREVISION=	1
CATEGORIES=	x11-themes xfce
PKGNAMEPREFIX=	xfce-icons-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Elementary icons, extended and maintained for Xfce
WWW=		https://github.com/shimmerproject/elementary-xfce

LICENSE=	gpl2

BUILD_DEPENDS=	optipng:graphics/optipng

USES=		compiler:c11 gnome pkgconfig
USE_GNOME=	gdkpixbuf2:build gtk30:build

HAS_CONFIGURE=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	shimmerproject
GH_PROJECT=	elementary-xfce

NO_ARCH=	yes
INSTALLS_ICONS=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-O0|${CFLAGS}|' \
		${WRKSRC}/svgtopng/Makefile

.include <bsd.port.mk>
