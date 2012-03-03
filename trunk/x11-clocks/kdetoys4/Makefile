#
# $MidnightBSD: mports/x11-clocks/kdetoys4/Makefile,v 1.1 2009/01/05 01:40:10 ctriv Exp $
#

PORTNAME=	kdetoys
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11-clocks kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of entertaining, educational programs for KDE
LICENSE=	gpl2

LATEST_LINK=	${PORTNAME}4

USE_KDE4=	kdehier kdelibs kdeprefix workspace automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	dbus gui qt3support \
		qmake_build moc_build rcc_build uic_build
USE_XORG=	x11
USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

MAN6=	amor.6

.include <bsd.port.mk>
