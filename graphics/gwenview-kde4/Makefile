# $MidnightBSD$
# $FreeBSD: ports/graphics/gwenview-kde4/Makefile,v 1.43 2012/02/16 15:56:56 ashish Exp $

PORTNAME=	gwenview
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image viewer and browser for KDE 4
LICENSE=	gpl2

LATEST_LINK=	${PORTNAME}-kde4

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		soprano.4:${PORTSDIR}/textproc/soprano \
		exiv2.10:${PORTSDIR}/graphics/exiv2 \
		kipi.8:${PORTSDIR}/graphics/libkipi-kde4

CONFLICTS=	kdegraphics-4.[0-6].*

USE_KDE4=	kdehier kdelibs kdeprefix baseapps automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	dbus qmake_build moc_build uic_build rcc_build
USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
