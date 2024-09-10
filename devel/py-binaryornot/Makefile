PORTNAME=	binaryornot
DISTVERSION=	0.4.4
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight pure Python package to check if a file is binary or text
WWW=		https://github.com/audreyr/binaryornot

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}chardet>=3.0.2:textproc/py-chardet@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
