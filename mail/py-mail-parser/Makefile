PORTNAME=	mail-parser
PORTVERSION=	4.6.5
CATEGORIES=	mail python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	mail_parser-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper for email standard library
WWW=		https://github.com/SpamScope/mail-parser

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.27<1.32:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	msgconvert:mail/p5-Email-Outlook-Message
USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

# Keep patch backups outside the Python package selected by Hatchling.
post-patch:
	@if [ -f ${WRKSRC}/src/mailparser/utils.py.orig ]; then \
		${MV} ${WRKSRC}/src/mailparser/utils.py.orig ${WRKDIR}/mailparser-utils.py.orig; \
	fi

.include <bsd.port.mk>
