PORTNAME=	bgs
DISTVERSIONPREFIX=	v
DISTVERSION=	0.8
CATEGORIES=	x11

MAINTAINER=	kazuok@midnightbsd.org
COMMENT=	Simple X11 BackGround Setter using Imlib2

LICENSE=	mit

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	libImlib2.so:graphics/imlib2

USES=		pkgconfig xorg
USE_XORG=	x11 xinerama

USE_GITHUB=	yes
GH_ACCOUNT=	Gottox

PLIST_FILES=	bin/bgs \
		man/man1/bgs.1.gz


.include <bsd.port.mk>
