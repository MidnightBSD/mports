# $MidnightBSD$

PORTNAME=	automoc4
PORTVERSION=	0.9.84
CATEGORIES=	devel kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	unstable/automoc4/0.9.84/
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatic moc for Qt 4 packages
LICENSE=	bsd2

USE_BZIP2=	yes
USE_ICONV=	yes
USE_KDE4=	kdeprefix kdehier
USE_QT_VER=	4
QT_COMPONENTS=	uic moc rcc qmake corelib
USE_CMAKE=	yes
CMAKE_VERBOSE=	yes
CMAKE_USE_PTHREAD=	yes

.include <bsd.port.mk>
