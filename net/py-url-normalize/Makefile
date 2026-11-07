PORTNAME=	url-normalize
PORTVERSION=	3.0.1
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	url_normalize-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	URL normalization for Python
WWW=		https://github.com/niksite/url-normalize

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}idna>=3.3:dns/py-idna@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
