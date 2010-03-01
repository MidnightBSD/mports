# $MidnightBSD$

PORTNAME=	kdelibs-experimental
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11 kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
PKGNAMESUFFIX?=	# empty
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Experimantal set of libraries needed by KDE programs
LICENSE=	gpl2

LATEST_LINK=	${PORTNAME}4

USE_KDE4=	kdelibs kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib opengl dbus phonon \
		qmake_build moc_build rcc_build uic_build
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
