PORTNAME=	gtts
DISTVERSIONPREFIX=	v
DISTVERSION=	2.2.1
CATEGORIES=	audio python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library/CLI tool to interface with Google Translate text-to-speech API

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}click>0:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR}

USES=		python:3.6+
USE_GITHUB=	yes
GH_ACCOUNT=	pndurette
GH_PROJECT=	gTTS
USE_PYTHON=	distutils concurrent autoplist

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
