PORTNAME=	pymongo
PORTVERSION=	4.18.2
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python driver for MongoDB
WWW=		https://github.com/mongodb/mongo-python-driver

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-requirements-txt>=0.4.1:devel/py-hatch-requirements-txt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>1.24:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dnspython>=2.7.0,1<3.0.0,1:dns/py-dnspython@${PY_FLAVOR}

USES=		cpe python:3.9+ python-setuptools:78
CPE_VENDOR=	mongodb
USE_PYTHON=	autoplist concurrent pep517

CONFLICTS_INSTALL=	py[0-9][0-9]-pymongo28

post-install:
	        ${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/bson/_cbson${PYTHON_TAG}.so
	        ${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/pymongo/_cmessage${PYTHON_TAG}.so

.include <bsd.port.mk>
