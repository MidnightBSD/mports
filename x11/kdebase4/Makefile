# $MidnightBSD: mports/x11/kdebase4/Makefile,v 1.1 2008/12/13 01:47:13 ctriv Exp $

PORTNAME=	kdebase
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11 kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic applications for the KDE system
LICENSE=	gpl2

LIB_DEPENDS=	searchclient:${PORTSDIR}/deskutils/strigi \
		soprano.4:${PORTSDIR}/textproc/soprano \
		qimageblitz.4:${PORTSDIR}/x11/qimageblitz

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib opengl dbus qt3support \
		designer network svg qtestlib \
		qmake_build moc_build rcc_build uic_build

USE_GETTEXT=	yes
USE_KDE4=	kdelibs workspace kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
MAKE_JOBS_SAFE=	yes

CMAKE_ARGS+=	-DCMAKE_REQUIRED_FLAGS:STRING="-L${LOCALBASE}/lib" \
		-DWITH_RAW1394:BOOL=OFF \
		-DWITH_PCIUTILS:BOOL=OFF

MAN1=		kappfinder.1 \
		kbookmarkmerger.1 \
		kfind.1

LIB_DEPENDS+=	usb-0.1:${PORTSDIR}/devel/libusb

.include <bsd.port.mk>
