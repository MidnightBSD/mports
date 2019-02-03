# $MidnightBSD$
# $FreeBSD: head/graphics/qt5-imageformats/Makefile 412346 2016-04-01 14:00:51Z mat $

PORTNAME=	imageformats
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt plugins for additional image formats

LICENSE=	gpl3

LIB_DEPENDS=	libjasper.so:${PORTSDIR}/graphics/jasper \
		libmng.so:${PORTSDIR}/graphics/libmng \
		libtiff.so:${PORTSDIR}/graphics/tiff \
		libwebp.so:${PORTSDIR}/graphics/webp

USE_QT5=	core gui buildtools_build
QT_DIST=	${PORTNAME}
USES=		qmake

.include <bsd.port.mk>
