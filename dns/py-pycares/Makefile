# Created by: Dmitry Sivachenko <mitya@yandex-team.ru>

PORTNAME=	pycares
PORTVERSION=	3.1.1
CATEGORIES=	dns python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to c-ares

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.5.0:devel/py-cffi@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.5.0:devel/py-cffi@${PY_FLAVOR}

USES=		python:3.5+
USE_PYTHON=	distutils autoplist

OPTIONS_DEFINE=	IDNA
IDNA_DESC=	IDNA support
IDNA_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}idna>0:dns/py-idna@${PY_FLAVOR}
IDNA_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}idna>0:dns/py-idna@${PY_FLAVOR}

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${PORTNAME}/_cares.so

.include <bsd.port.mk>
