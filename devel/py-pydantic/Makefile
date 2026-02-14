PORTNAME=	pydantic
DISTVERSION=	1.10.20
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data validation and settings management using python 3.6 type hinting
WWW=		https://github.com/samuelcolvin/pydantic

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.2.0:devel/py-typing-extensions@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	distutils cython autoplist

CPE_VENDOR=	pydantic_project

NO_TEST=	yes

.include <bsd.port.mk>
