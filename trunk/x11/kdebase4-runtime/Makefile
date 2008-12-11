# -*-mode: makefile-*-
#
# $MidnightBSD: ports/x11/kdebase4-runtime/Makefile,v 1.210 2008/09/03 13:06:22 miwi Exp $
#

PORTNAME=	kdebase-runtime
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11 kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic applications for the KDE system
LICENSE=	gpl2

LIB_DEPENDS=	usb-0.1.8:${PORTSDIR}/devel/libusb \
		xcb.1:${PORTSDIR}/x11/libxcb \
		xine.1:${PORTSDIR}/multimedia/libxine \
		xklavier.12:${PORTSDIR}/x11/libxklavier
RUN_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

USE_KDE4=	kdelibs pimlibs kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib opengl moc rcc uic dbus
USE_FAM=	yes
USE_GETTEXT=	yes

MAN1=  kdesu.1

post-extract:
	${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
