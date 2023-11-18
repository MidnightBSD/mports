PORTNAME=	ffnvcodec-headers
DISTVERSIONPREFIX=	n
DISTVERSION=	12.0.16.1
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FFmpeg version of Nvidia Codec SDK headers
WWW=		https://github.com/FFmpeg/nv-codec-headers

LICENSE=	mit

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	FFmpeg
GH_PROJECT=	nv-codec-headers

MAKE_ARGS+=	PREFIX="${PREFIX}"
NO_ARCH=	yes

.include <bsd.port.mk>
