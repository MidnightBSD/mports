PORTNAME=	psutil
PORTVERSION=	5.9.0
PORTREVISION=	1
CATEGORIES=	sysutils python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Process utilities module for Python
WWW=		https://github.com/giampaolo/psutil

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=43:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USE_PYTHON=	autoplist concurrent distutils
USES=		cpe python

LDFLAGS+=	-lutil

CPE_VENDOR=	psutil_project

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}psutil121

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
