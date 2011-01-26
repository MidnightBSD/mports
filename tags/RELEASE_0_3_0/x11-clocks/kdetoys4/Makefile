#
# $MidnightBSD: ports/x11-clocks/kdetoys4/Makefile,v 1.73 2008/09/03 13:06:24 miwi Exp $
#

PORTNAME=	kdetoys
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11-clocks kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of entertaining, educational programs for KDE
LICENSE=	gpl2

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	opengl gui moc rcc uic
USE_KDE4=	kdelibs workspace kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes

post-extract:
	@${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
