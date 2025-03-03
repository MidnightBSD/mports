PORTNAME=	pecan
PORTVERSION=	1.3.3
PORTREVISION=	1
CATEGORIES=	www python net
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WSGI object-dispatching web framework
WWW=		https://github.com/pecan/pecan/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}webob>=1.2:www/py-webob@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mako>=0.4.0:textproc/py-mako@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}webtest>=1.3.1:www/py-webtest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}logutils>=0.3:devel/py-logutils@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist concurrent

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
