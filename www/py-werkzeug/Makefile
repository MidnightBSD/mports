PORTNAME=	werkzeug
PORTVERSION=	1.0.1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Werkzeug-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python utilities collection for building WSGI applications

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}openssl>=16.0:security/py-openssl@${PY_FLAVOR}

USES=		cpe python:3.7+
USE_PYTHON=	autoplist concurrent distutils
CPE_VENDOR=	palletsprojects

NO_ARCH=	yes

OPTIONS_DEFINE=	EXAMPLES WATCHDOG
WATCHDOG_DESC=	Monitor filesystem events

WATCHDOG_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}watchdog>=0.8:devel/py-watchdog@${PY_FLAVOR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
