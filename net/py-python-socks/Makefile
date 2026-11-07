PORTNAME=	python-socks
PORTVERSION=	3.1.1
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core proxy (SOCKS4, SOCKS5, HTTP tunneling) functionality for Python
WWW=		https://pypi.org/project/python-socks/ \
		https://github.com/romis2012/python-socks

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}anyio>=4.12.1<5.0.0:devel/py-anyio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trio>=0.30.0:net/py-trio@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}async_timeout>=5.0.1:devel/py-async_timeout@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
