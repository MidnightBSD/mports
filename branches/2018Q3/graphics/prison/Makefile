# $MidnightBSD$
# $FreeBSD: ports/graphics/prison/Makefile,v 1.1 2011/10/16 22:59:10 avilla Exp $

PORTNAME=	prison
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}/${PORTVERSION}/src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Barcode library for KDE

LICENSE=	gpl2

LIB_DEPENDS=	libdmtx.so:${PORTSDIR}/graphics/libdmtx \
		libqrencode.so:${PORTSDIR}/graphics/libqrencode

USE_QT4=	corelib gui qmake_build moc_build rcc_build uic_build
USES=		cmake
USE_LDCONFIG=	yes

.include <bsd.port.mk>
