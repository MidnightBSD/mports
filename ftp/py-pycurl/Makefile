PORTNAME=	pycurl
PORTVERSION=	7.49.0
CATEGORIES=	ftp python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to libcurl
WWW=		http://pycurl.io/ \
		https://github.com/pycurl/pycurl

LICENSE=	lgpl2.1 mit
LICENSE_COMB=	dual
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING-LGPL
LICENSE_FILE_mit=	${WRKSRC}/COPYING-MIT

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libcurl.so:ftp/curl

USES=		python:3.10+ python-setuptools:83 ssl
USE_PYTHON=	autoplist concurrent pep517

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
