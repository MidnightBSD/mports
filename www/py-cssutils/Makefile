# Created by: ijliao

PORTNAME=	cssutils
PORTVERSION=	1.0.2
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS Cascading Style Sheets library for Python

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	dual

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/examples/* ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
