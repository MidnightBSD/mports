# $MidnightBSD$

PORTNAME=	meson
PORTVERSION=	0.48.0
CATEGORIES=	devel python
MASTER_SITES=	https://github.com/mesonbuild/${PORTNAME}/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance build system

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS+=	ninja:devel/ninja \
		python2.7:lang/python27
RUN_DEPENDS+=	ninja:devel/ninja \
		python2.7:lang/python27

USES=		python:3.5+
USE_PYTHON=	autoplist distutils noflavors
NO_ARCH=	yes

.include <bsd.port.mk>
