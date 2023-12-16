PORTNAME=	aiosmtpd
DISTVERSION=	1.4.4
CATEGORIES=	mail python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Asyncio based SMTP server
WWW=		https://aiosmtpd.readthedocs.io/

LICENSE=	apache2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}atpublic>=0:devel/py-atpublic@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}attrs>=0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=0:devel/py-typing-extensions@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

.include <bsd.port.mk>
