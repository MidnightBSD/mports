PORTNAME=	bgs
DISTVERSIONPREFIX=	v
DISTVERSION=	0.8
PORTREVISION=	2
CATEGORIES=	x11

MAINTAINER=	kazuok@midnightbsd.org
COMMENT=	Simple X11 BackGround Setter using Imlib2
WWW=		https://github.com/Gottox/bgs

LICENSE=	mit

#FAKE_OPTS=	trueprefix

LIB_DEPENDS=	libImlib2.so:graphics/imlib2

USES=		pkgconfig xorg
USE_XORG=	x11 xinerama

USE_GITHUB=	yes
GH_ACCOUNT=	Gottox

MAKE_ARGS=	PREFIX="${TRUE_PREFIX}"

PLIST_FILES=	bin/bgs \
		share/man/man1/bgs.1.gz

post-install:
	${STRIP_CMD} ${PREFIX}/bin/bgs

.include <bsd.port.mk>
