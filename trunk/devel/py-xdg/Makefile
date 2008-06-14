# New ports collection makefile for:	py-xdg
# Date created:		2004-06-25
# Whom:			michael johnson <ahze@ahze.net>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/py-xdg/Makefile,v 1.19 2007/10/24 23:35:16 marcus Exp $
#   $MCom: ports/devel/py-xdg/Makefile,v 1.4 2007/09/10 05:35:05 mezz Exp $
#

PORTNAME=	xdg
PORTVERSION=	0.15
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
		's|/etc|${LOCALBASE}/etc|g ; s|%%LOCALBASE%%|${LOCALBASE}|g' \
			${WRKSRC}/xdg/BaseDirectory.py \
			${WRKSRC}/xdg/IconTheme.py

.include <bsd.port.mk>
