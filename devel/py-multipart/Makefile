PORTNAME=	multipart
PORTVERSION=	2.0.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/defnull/multipart/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parser for multipart/form-data
WWW=		https://github.com/defnull/multipart

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	allflavors 	autoplist concurrent pep517

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.9<4:devel/py-flit-core@${PY_FLAVOR}

.include <bsd.port.mk>
