PORTNAME=	python-dotenv
PORTVERSION=	1.0.1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Add .env support to your django/flask apps
WWW=		https://github.com/theskumar/python-dotenv

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent distutils

CONFLICTS_INSTALL=	rubygem-dotenv # bin/dotenv

NO_ARCH=	yes

OPTIONS_DEFINE=	CLI
OPTIONS_DEFAULT=CLI
CLI_DESC=	Command-line interface support

CLI_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}click>=5.0:devel/py-click@${PY_FLAVOR}

.include <bsd.port.mk>
