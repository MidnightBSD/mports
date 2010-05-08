#
# $MidnightBSD: mports/misc/kdeutils4/Makefile,v 1.1 2009/01/05 03:37:49 ctriv Exp $
#

PORTNAME=	kdeutils
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	misc kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities for the KDE4 integrated X11 Desktop
LICENSE=	gpl2

LIB_DEPENDS=    gmp.10:${PORTSDIR}/math/gmp \
		netsnmp:${PORTSDIR}/net-mgmt/net-snmp \
		qimageblitz.4:${PORTSDIR}/x11/qimageblitz \
		zip.1:${PORTSDIR}/archivers/libzip
RUN_DEPENDS=    gpg:${PORTSDIR}/security/gnupg

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
USE_QT_VER=	4
KDE4_BUILDENV= yes
USE_KDE4=	kdelibs pimlibs workspace kdeprefix kdehier automoc4
QT_COMPONENTS=	network gui moc rcc uic porting xml

post-extract:
	${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
