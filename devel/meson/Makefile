PORTNAME=	meson
PORTVERSION=	0.52.1
CATEGORIES=	devel python
MASTER_SITES=	https://github.com/mesonbuild/${PORTNAME}/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance build system

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS+= python2.7:lang/python27 \
		ninja:devel/ninja
RUN_DEPENDS+=	ninja:devel/ninja \
		python2.7:lang/python27

USES=		python:3.5+ shebangfix
USE_PYTHON=	autoplist distutils noflavors
SHEBANG_FILES=	mesonbuild/cmake/data/run_ctgt.py
NO_ARCH=	yes

.include <bsd.port.mk>
