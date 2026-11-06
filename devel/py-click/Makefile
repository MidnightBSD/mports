PORTNAME=	click
PORTVERSION=	8.5.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python package for creating command line interfaces
WWW=		https://github.com/pallets/click

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.11<4:devel/py-flit-core@${PY_FLAVOR}

USES=		python
USES+=	cpe
CPE_VENDOR=	palletsprojects
USE_PYTHON=	allflavors 	autoplist concurrent pep517 pytest

NO_ARCH=	yes
NO_TEST=	yes

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

TEST_ARGS=	--disable-plugin-autoload

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
.endif

.include <bsd.port.post.mk>
