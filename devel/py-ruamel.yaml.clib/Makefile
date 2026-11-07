PORTNAME=	ruamel.yaml.clib
PORTVERSION=	0.2.15
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	ruamel_yaml_clib-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C version of reader, parser and emitter for ruamel.yaml
WWW=		https://sourceforge.net/projects/ruamel-yaml-clib/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent cython pep517

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

WRKSRC=		${WRKDIR}/ruamel.yaml.clib-${PORTVERSION}

.include <bsd.port.mk>
