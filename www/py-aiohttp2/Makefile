# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	aiohttp
PORTVERSION=	2.3.10
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP client/server for asyncio

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}async_timeout>=1.2.0:devel/py-async_timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}chardet>=0:textproc/py-chardet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}idna_ssl>=1.0.0:dns/py-idna_ssl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}multidict>=4.0.0:www/py-multidict@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}yarl>=1.0.0:www/py-yarl@${PY_FLAVOR}

USES=		python:3.4+
USE_PYTHON=	autoplist cython distutils

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/aiohttp/*.so

.include <bsd.port.mk>
