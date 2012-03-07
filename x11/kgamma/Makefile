# $MidnightBSD$
# $FreeBSD: ports/x11/kgamma/Makefile,v 1.16 2012/02/16 15:57:31 ashish Exp $

PORTNAME=	kgamma
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11 kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE 4 monitor calibration tool
LICENSE=	gpl2

CONFLICTS=	kdegraphics-4.[0-6].*

USE_KDE4=	kdehier kdelibs kdeprefix automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	dbus qmake_build moc_build uic_build rcc_build
USE_XORG=	x11 xxf86vm
USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
