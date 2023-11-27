PORTNAME=	trustme
PORTVERSION=	1.1.0
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Top quality TLS certs while you wait, for the discerning tester
WWW=		https://github.com/python-trio/trustme

LICENSE=	apache2 mit
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.APACHE2
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.MIT

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}idna>=0:dns/py-idna@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist cryptography distutils
NO_ARCH=	yes

.include <bsd.port.mk>
