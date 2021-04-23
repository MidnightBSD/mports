PORTNAME=	markupsafe
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	MarkupSafe-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implements XML/HTML/XHTML Markup safe string for Python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

USES=		python:2.7+
USE_PYTHON=	autoplist concurrent distutils

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/markupsafe/_speedups*.so

.include <bsd.port.mk>
