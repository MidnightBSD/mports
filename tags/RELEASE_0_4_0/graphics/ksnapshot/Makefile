# $MidnightBSD: mports/graphics/ksnapshot/Makefile,v 1.1 2012/03/06 02:27:04 laffer1 Exp $

PORTNAME=	ksnapshot
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE 4 screen capture program
LICENSE=	gpl2

CONFLICTS=	kdegraphics-4.[0-6].*

USE_KDE4=	kdehier kdelibs kdeprefix libkipi automoc4
USES=		cmake:outsource
USE_QT4=	moc_build qmake_build rcc_build uic_build
USE_XORG=	x11 xext xfixes
USE_XZ=		yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
