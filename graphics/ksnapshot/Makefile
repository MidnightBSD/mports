# $MidnightBSD$
# $FreeBSD: ports/graphics/ksnapshot/Makefile,v 1.2 2012/02/16 15:56:58 ashish Exp $

PORTNAME=	ksnapshot
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE 4 screen capture program
LICENSE=	gpl2

LIB_DEPENDS=	kipi.8:${PORTSDIR}/graphics/libkipi-kde4

CONFLICTS=	kdegraphics-4.[0-6].*

USE_KDE4=	kdehier kdelibs kdeprefix automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	dbus qmake_build moc_build uic_build rcc_build
USE_XORG=	x11 xext xfixes
USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
