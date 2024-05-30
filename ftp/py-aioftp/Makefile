PORTNAME=	aioftp
PORTVERSION=	0.22.3
CATEGORIES=	ftp python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FTP client/server for asyncio
WWW=		https://pypi.org/project/aioftp/ \
		https://aioftp.readthedocs.io/ \
		https://github.com/aio-libs/aioftp

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/license.txt

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}siosocks>=0:net/py-siosocks@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
