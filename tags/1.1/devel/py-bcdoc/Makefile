# $MidnightBSD$

PORTNAME=	bcdoc
PORTVERSION=	0.12.2
CATEGORIES=	devel
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to help document botocore-based projects

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docutils>=0.10:${PORTSDIR}/textproc/py-docutils \
		${PYTHON_PKGNAMEPREFIX}six>=1.1.0:${PORTSDIR}/devel/py-six

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
