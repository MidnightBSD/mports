PORTNAME=	meson
PORTVERSION=	1.0.1
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	https://github.com/mesonbuild/${PORTNAME}/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance build system
WWW=		https://mesonbuild.com/

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING


BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		ninja:run python:3.7+ shebangfix
USE_PYTHON=	autoplist pep517
SHEBANG_FILES=	mesonbuild/rewriter.py \
		mesonbuild/scripts/cmake_run_ctgt.py
NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_VER} != ${PYTHON_DEFAULT}
PKGNAMESUFFIX=	${PYTHON_PKGNAMESUFFIX}
.endif

.include <bsd.port.post.mk>
