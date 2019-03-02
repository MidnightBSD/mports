# Created by: Peter Schuller <peter.schuller@infidyne.com>
# $FreeBSD: head/devel/py-boto/Makefile 394189 2015-08-13 19:49:42Z rm $
# $MidnightBSD$

PORTNAME=	boto
PORTVERSION=	2.48.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to Amazon Web Services

LICENSE=	mit

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist concurrent distutils

CONFLICTS_INSTALL=	p5-Net-Amazon-Route53-[0-9]*

.include <bsd.port.mk>
