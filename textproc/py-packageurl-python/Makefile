PORTNAME=	packageurl-python
DISTVERSION=	0.17.6
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	packageurl_python-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parser and builder for package URLs (aka purl)
WWW=		https://github.com/package-url/packageurl-python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/mit.LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

.include <bsd.port.mk>
