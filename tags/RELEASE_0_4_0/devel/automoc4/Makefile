# $MidnightBSD: mports/devel/automoc4/Makefile,v 1.6 2010/11/11 01:30:51 laffer1 Exp $

PORTNAME=	automoc4
PORTVERSION=	0.9.88
PORTREVISION=	1
CATEGORIES=	devel kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}/${PORTVERSION}/
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
CMAKE_USE_PTHREAD=	yes
MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.mk>
