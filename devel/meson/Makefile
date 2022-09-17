PORTNAME=	meson
PORTVERSION=	0.62.1
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	https://github.com/mesonbuild/${PORTNAME}/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance build system
WWW=		https://mesonbuild.com/

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		ninja:run python:3.7+ shebangfix
USE_PYTHON=	autoplist distutils noflavors
SHEBANG_FILES=	mesonbuild/rewriter.py \
		mesonbuild/scripts/cmake_run_ctgt.py
NO_ARCH=	yes

.include <bsd.port.mk>
