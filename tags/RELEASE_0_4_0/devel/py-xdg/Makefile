# $MidnightBSD: mports/devel/py-xdg/Makefile,v 1.1 2008/06/14 00:10:15 laffer1 Exp $
# $FreeBSD: ports/devel/py-xdg/Makefile,v 1.19 2007/10/24 23:35:16 marcus Exp $

PORTNAME=	xdg
PORTVERSION=	0.19
PORTREVISION=	0
CATEGORIES=	devel python
MASTER_SITES=	http://www.freedesktop.org/~lanius/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A python library to access freedesktop.org standards
LICENSE=	lgpl

USE_PYTHON=	yes
USE_PYDISTUTILS=yes
PYDISTUTILS_PKGNAME=	pyxdg

post-patch:
	@${REINPLACE_CMD} -e \
		's|%%LOCALBASE%%|${LOCALBASE}|g' \
			${WRKSRC}/xdg/BaseDirectory.py

.include <bsd.port.mk>
