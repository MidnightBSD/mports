PORTNAME=	flask
DISTVERSION=	3.0.2
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Micro web framework
WWW=		http://flask.pocoo.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=0<4:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}werkzeug>=3.0.0:www/py-werkzeug@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=3.1.2:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}itsdangerous>=2.1.2:security/py-itsdangerous@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}click>=8.0:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}blinker>=0:devel/py-blinker@${PY_FLAVOR}

USES=		cpe python
CPE_VENDOR=	palletsprojects
USE_PYTHON=	pep517 concurrent autoplist

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=3.6.0:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
