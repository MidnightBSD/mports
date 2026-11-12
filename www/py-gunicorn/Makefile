PORTNAME=	gunicorn
DISTVERSION=	26.2.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WSGI HTTP Server for UNIX
WWW=		https://gunicorn.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

OPTIONS_DEFINE=		PROCTITLE
OPTIONS_DEFAULT=	PROCTITLE
OPTIONS_GROUP=		WORKERS
OPTIONS_GROUP_WORKERS=	GEVENT TORNADO

GEVENT_DESC=	Greenlet worker
PROCTITLE_DESC=	Custom process titles with setproctitle(3)
TORNADO_DESC=	Tornado async worker

GEVENT_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gevent>=24.10.1:devel/py-gevent@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}packaging>0:devel/py-packaging@${PY_FLAVOR}
PROCTITLE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setproctitle>0:devel/py-setproctitle@${PY_FLAVOR}
TORNADO_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tornado>=6.5.7:www/py-tornado@${PY_FLAVOR}

.include <bsd.port.mk>
