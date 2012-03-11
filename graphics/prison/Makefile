# $MidnightBSD$
# $FreeBSD: ports/graphics/prison/Makefile,v 1.1 2011/10/16 22:59:10 avilla Exp $

PORTNAME=	prison
PORTVERSION=	1.0
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}/${PORTVERSION}/src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A barcode library for KDE
LICENSE=	gpl2

LIB_DEPENDS=	dmtx.0:${PORTSDIR}/graphics/libdmtx \
		qrencode.3:${PORTSDIR}/graphics/libqrencode

USE_QT_VER=	4
QT_COMPONENTS=	corelib gui qmake_build moc_build rcc_build uic_build
USE_CMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
