PORTNAME=	txaio
PORTVERSION=	18.8.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compatibility API between asyncio/Twisted/Trollius

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils

NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3300
TEST_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}trollius>=2.0:devel/py-trollius@${PY_FLAVOR}
.elif ${PYTHON_REL} >= 3300
TEST_DEPENDS+=  ${PYTHON_PKGNAMEPREFIX}asyncio>=3.4.3:devel/py-asyncio@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
