PORTNAME=	mail-parser
PORTVERSION=	3.15.0
CATEGORIES=	mail python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper for email standard library
WWW=		https://github.com/SpamScope/mail-parser

LICENSE=	Apache-2.0

RUN_DEPENDS=	msgconvert:mail/p5-Email-Outlook-Message \
		${PYTHON_PKGNAMEPREFIX}simplejson>=3.17.0:devel/py-simplejson@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.14.0:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
