# $MidnightBSD$
# $FreeBSD: ports/devel/py-orbit/Makefile,v 1.20 2007/05/28 23:34:38 mezz Exp $

PORTNAME=	orbit
PORTVERSION=	2.24.0
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/pyorbit/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyorbit-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for ORBit2

LICENSE=	lgpl

CONFLICTS=	py*-omniorb-[0-9]*

USES=		gmake libtool pathfix pkgconfig python tar:bzip2
USE_GNOME=	orbit2
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
