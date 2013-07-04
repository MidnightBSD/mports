# $MidnightBSD$
# $FreeBSD: ports/deskutils/kruler/Makefile,v 1.2 2012/02/16 15:56:46 ashish Exp $

PORTNAME=	kruler
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	deskutils kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE 4 screen ruler
LICENSE=	gpl2

CONFLICTS=	kdegraphics-4.[0-6].*

USE_KDE4=	kdehier kdelibs kdeprefix automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib qmake_build moc_build uic_build rcc_build
USE_XORG=	x11
USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
