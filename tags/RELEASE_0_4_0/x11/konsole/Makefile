# $MidnightBSD$
# $FreeBSD: ports/x11/konsole/Makefile,v 1.3 2012/02/16 15:57:31 ashish Exp $

PORTNAME=	konsole
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11 kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE terminal emulator
LICENSE=	gpl2

CONFLICTS=	kdebase-4.[0-6].*

USE_BZIP2=	yes
USE_KDE4=	kdelibs kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	xml moc_build qmake_build rcc_build uic_build
USE_XORG=	x11 xrender
CMAKE_ARGS+=	-DCMAKE_REQUIRED_FLAGS:STRING="-L${LOCALBASE}/lib"
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
