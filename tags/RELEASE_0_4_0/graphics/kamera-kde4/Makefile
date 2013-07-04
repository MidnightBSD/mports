# $MidnightBSD$
# $FreeBSD: ports/graphics/kamera-kde4/Makefile,v 1.32 2012/02/16 15:56:56 ashish Exp $

PORTNAME=	kamera
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Digital camera manager for KDE 4
LICENSE=	gpl2

LATEST_LINK=	${PORTNAME}-kde4

LIB_DEPENDS=	gphoto2.2:${PORTSDIR}/graphics/libgphoto2

CONFLICTS=	kdegraphics-4.[0-6].*

USE_KDE4=	kdehier kdelibs kdeprefix automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	dbus qt3support qmake_build moc_build uic_build rcc_build
USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
