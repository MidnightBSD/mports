# -*-mode: makefile-*-
#
# $MidnightBSD: mports/x11/kdebase4-runtime/Makefile,v 1.1 2008/12/11 17:45:31 ctriv Exp $
#

PORTNAME=	kdebase-runtime
PORTVERSION=	${KDE4_VERSION}
PORTREVISION=	1
CATEGORIES=	x11 kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic applications for the KDE system
LICENSE=	gpl2

LIB_DEPENDS=	usb-0.1.8:${PORTSDIR}/devel/libusb \
		xcb.2:${PORTSDIR}/x11/libxcb \
		xine.1:${PORTSDIR}/multimedia/libxine \
		xklavier.12:${PORTSDIR}/x11/libxklavier
BUILD_DEPENDS+=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme
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
