PORTNAME=	editables
PORTVERSION=	0.6
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Editable installations
WWW=		https://github.com/pfmoore/editables

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.3:devel/py-flit-core@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
