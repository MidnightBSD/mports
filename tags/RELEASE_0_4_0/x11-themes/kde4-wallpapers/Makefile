# $MidnightBSD$
# $FreeBSD: ports/x11-themes/kde4-wallpapers/Makefile,v 1.2 2012/02/16 15:57:33 ashish Exp $

PORTNAME=	kde-wallpapers
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11-themes kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of wallpapers for the KDE Plasma workspace
LICENSE=	gpl2

CONFLICTS=	kdebase-workspace-4.[0-6].*

USE_BZIP2=	yes
USE_KDE4=	automoc4 kdehier kdelibs kdeprefix
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	moc_build qmake_build rcc_build uic_build

NO_BUILD=	yes

.include <bsd.port.mk>
