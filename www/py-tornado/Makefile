PORTNAME=	tornado
PORTVERSION=	6.4
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Web Server from FriendFeed
WWW=		https://www.tornadoweb.org/ \
		https://github.com/tornadoweb/tornado

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	autoplist concurrent pep517

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}tornado4 \
			${PYTHON_PKGNAMEPREFIX}tornado5 \
			${PYTHON_PKGNAMEPREFIX}tornado6

CPE_VENDOR=	tornadoweb
NO_TEST=	yes

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
