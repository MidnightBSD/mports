#
# $MidnightBSD: mports/sysutils/kdeadmin4/Makefile,v 1.1 2008/12/13 03:22:35 ctriv Exp $
#

PORTNAME=	kdeadmin
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	sysutils kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE Admin applications
LICENSE=	gpl2

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
USE_KDE4=	kdelibs pimlibs kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	dbus moc_build qmake_build rcc_build uic_build
MAKE_JOBS_SAFE=	yes

# Disable system-config-printer-kde, it comes with
# print/system-config-printer-kde.
CMAKE_ARGS+=	-DBUILD_system-config-printer-kde:BOOL=Off

OPTIONS=	PRINTER_CONFIG "Install printer configuration utility" off

.include <bsd.mport.options.mk>

.if defined(WITH_PRINTER_CONFIG)
RUN_DEPENDS+=	${KDE4_PREFIX}/share/apps/system-config-printer-kde/system-config-printer-kde.py:${PORTSDIR}/print/system-config-printer-kde
.endif

.include <bsd.port.mk>
