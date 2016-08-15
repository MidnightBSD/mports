# Created by: Koop Mast <kwm@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/devel/py3-libpeas/Makefile 389277 2015-06-12 15:14:18Z kwm $

PORTNAME=	libpeas
PORTREVISION=	0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

COMMENT=	libpeas Python 3 support

LIB_DEPENDS+=	libpeas-1.0.so:${PORTSDIR}/devel/libpeas

LIBPEAS_SLAVE=	python3

BUILD_WRKSRC=	${WRKSRC}/loaders/python3
INSTALL_WRKSRC=	${WRKSRC}/loaders/python3

MASTERDIR=	${.CURDIR}/../../devel/libpeas/

.include "${MASTERDIR}/Makefile"
