PORTNAME=	Genshi
PORTVERSION=	0.7.3
PORTREVISION=	1
CATEGORIES=	textproc www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolkit for generation of output for the web
WWW=		https://genshi.edgewall.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		python:3.6+
USE_PYTHON=	distutils autoplist

OPTIONS_DEFINE=	BABEL
BABEL_DESC=	I18n support through the Babel plugin

BABEL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Babel>=0.8:devel/py-babel@${PY_FLAVOR}

NO_TEST=	yes
NO_ARCH=	yes

.include <bsd.port.mk>
