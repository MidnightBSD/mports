PORTNAME=	meson
PORTVERSION=	0.56.0
CATEGORIES=	devel python
MASTER_SITES=	https://github.com/mesonbuild/${PORTNAME}/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance build system

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS+= ninja:devel/ninja
RUN_DEPENDS+=	ninja:devel/ninja

USES=		python:3.5+ shebangfix
USE_PYTHON=	autoplist distutils noflavors
SHEBANG_FILES=	mesonbuild/rewriter.py \
		mesonbuild/scripts/cmake_run_ctgt.py
NO_ARCH=	yes

.include <bsd.port.mk>
