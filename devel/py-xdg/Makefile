# $MidnightBSD$

PORTNAME=	xdg
PORTVERSION=	0.25
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	http://people.freedesktop.org/~takluyver/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 2 library to access freedesktop.org standards

LICENSE=	lgpl

USES=		python:2
USE_PYTHON=	distutils autoplist

post-patch:
	@${REINPLACE_CMD} -e \
		's|%%LOCALBASE%%|${LOCALBASE}|g' \
			${WRKSRC}/xdg/BaseDirectory.py

.include <bsd.port.mk>
