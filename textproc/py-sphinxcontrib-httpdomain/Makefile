PORTNAME=	sphinxcontrib-httpdomain
DISTVERSION=	2.2.1
CATEGORIES=	textproc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx domain for HTTP APIs
WWW=		https://github.com/sphinx-contrib/httpdomain

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build>=0.12.22<0.14.0:devel/py-uv-build@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=8.1.3,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

# Keep the upstream Finder metadata outside the packaged namespace.
post-extract:
	${MV} ${WRKSRC}/src/sphinxcontrib/.DS_Store ${WRKDIR}/upstream.DS_Store

.include <bsd.port.mk>
