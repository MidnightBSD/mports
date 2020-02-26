PORTNAME=	MarkupSafe
PORTVERSION=	1.1.1
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implements a XML/HTML/XHTML Markup safe string for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

USE_PYTHON=	autoplist concurrent distutils
USES=		python

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/markupsafe/_speedups.so

.include <bsd.port.mk>
