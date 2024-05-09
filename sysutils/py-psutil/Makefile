PORTNAME=	psutil
PORTVERSION=	5.9.0
PORTREVISION=	1
CATEGORIES=	sysutils python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Process utilities module for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}psutil121

USE_PYTHON=	autoplist concurrent distutils
USES=		cpe python

CPE_VENDOR=	psutil_project

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/psutil/_psutil_bsd*.so ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/psutil/_psutil_posix*.so

.include <bsd.port.mk>
