# $MidnightBSD$
# $FreeBSD: ports/devel/py-orbit/Makefile,v 1.20 2007/05/28 23:34:38 mezz Exp $

PORTNAME=	orbit
PORTVERSION=	2.24.0
PORTREVISION=	2
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

BUILD_DEPENDS+=	python3.7:lang/python37

USES=		gmake gnome libtool pathfix pkgconfig python:2.7 tar:bzip2
USE_PYTHON=	flavors
USE_GNOME=	orbit2
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
