PORTNAME=	py-serializable
PORTVERSION=	2.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/madpah/serializable/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py_serializable-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serialize and deserialize Python objects to/from JSON and XML
WWW=		https://github.com/madpah/serializable

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.0.0:devel/py-poetry-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}defusedxml>=0.7.1<0.8:devel/py-defusedxml@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
