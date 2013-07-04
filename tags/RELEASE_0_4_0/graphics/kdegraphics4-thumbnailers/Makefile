# $MidnightBSD$
# $FreeBSD: ports/graphics/kdegraphics4-thumbnailers/Makefile,v 1.2 2012/02/16 15:56:57 ashish Exp $

PORTNAME=	kdegraphics-thumbnailers
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Thumbnailers for various graphics file formats
LICENSE=	gpl2

LIB_DEPENDS=	kexiv2.10:${PORTSDIR}/graphics/libkexiv2-kde4 \
		kdcraw.20:${PORTSDIR}/graphics/libkdcraw-kde4

CONFLICTS=	kdegraphics-4.[0-6].*

USE_KDE4=	kdehier kdelibs kdeprefix automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	gui qmake_build moc_build uic_build rcc_build
USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
