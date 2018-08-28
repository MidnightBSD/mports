# $MidnightBSD$

PORTNAME=	twitter
PORTVERSION=	1.15.0
DISTVERSIONPREFIX=	${PORTNAME}-
CATEGORIES=	net python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	-tools

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python API and command-line toolset for Twitter

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}nose>0:${PORTSDIR}/devel/py-nose

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	distutils autoplist
USE_GITHUB=	yes

GH_ACCOUNT=	sixohsix

WRKSRC=		${WRKDIR}/twitter-twitter-1.15.0

regression-test: build
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
