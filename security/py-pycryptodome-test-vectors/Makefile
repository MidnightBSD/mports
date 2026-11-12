PORTNAME=	pycryptodome-test-vectors
DISTVERSION=	1.0.22
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Optional test vectors for PyCryptodome and PyCryptodomeX
WWW=		https://www.pycryptodome.org/

LICENSE=	bsd2 Apache-2.0
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

USES=		cpe python
CPE_VENDOR=	python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

.include <bsd.port.mk>
