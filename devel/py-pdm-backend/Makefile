PORTNAME=	pdm-backend
PORTVERSION=	2.4.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pdm_backend-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build backend used by PDM that supports latest packaging standards
WWW=		https://backend.pdm-project.org/ \
		https://github.com/pdm-project/pdm-backend

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent pep517

MAKE_ENV=	PYTHONPATH=${WRKSRC}/src
NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
BUILD_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=3.6:devel/py-importlib-metadata@${PY_FLAVOR}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=3.6:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
