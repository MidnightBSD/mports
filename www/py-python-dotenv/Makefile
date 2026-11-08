PORTNAME=	python-dotenv
PORTVERSION=	1.2.3
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python_dotenv-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Add .env support to your django/flask apps
WWW=		https://github.com/theskumar/python-dotenv

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

TEST_DEPENDS=	gprintenv:sysutils/coreutils \
		${PYTHON_PKGNAMEPREFIX}ipython>0:devel/ipython@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	allflavors autoplist concurrent pep517 pytest

CONFLICTS_INSTALL=	rubygem-dotenv # bin/dotenv

NO_ARCH=	yes
TEST_ENV=	PATH=${WRKDIR}/test-bin:${FAKE_DESTDIR}${PREFIX}/bin:${PATH}

OPTIONS_DEFINE=	CLI
OPTIONS_DEFAULT=CLI
CLI_DESC=	Command-line interface support

CLI_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}click>=5.0:devel/py-click@${PY_FLAVOR}

pre-test:
	${MKDIR} ${WRKDIR}/test-bin
	${LN} -sf ${LOCALBASE}/bin/gprintenv ${WRKDIR}/test-bin/printenv

.include <bsd.port.mk>
