# $MidnightBSD$

PORTNAME=	zope.interface
PORTVERSION=	4.1.3
CATEGORIES=	devel python zope
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	zope

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interfaces for Python

LICENSE=	zpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python
USE_PYTHON=	autoplist distutils

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/zope/interface/_zope_interface_coptimizations.so

.include <bsd.port.mk>
