# $MidnightBSD: mports/graphics/prison/Makefile,v 1.1 2012/03/11 01:04:47 laffer1 Exp $
# $FreeBSD: ports/graphics/prison/Makefile,v 1.1 2011/10/16 22:59:10 avilla Exp $

PORTNAME=	prison
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}/${PORTVERSION}/src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A barcode library for KDE
LICENSE=	gpl2

LIB_DEPENDS=	dmtx.0:${PORTSDIR}/graphics/libdmtx \
		qrencode.3:${PORTSDIR}/graphics/libqrencode

USE_QT4=	corelib gui qmake_build moc_build rcc_build uic_build
USES=		cmake
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
