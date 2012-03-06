# $MidnightBSD$
# $FreeBSD: ports/graphics/kdegraphics4-mobipocket/Makefile,v 1.2 2012/02/16 15:56:56 ashish Exp $

PORTNAME=	mobipocket
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
PKGNAMEPREFIX=	kdegraphics-
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mobipocket plugins for Strigi indexing, Okular and thumbnails
LICENSE=	gpl2

LIB_DEPENDS=	searchclient.0:${PORTSDIR}/deskutils/strigi \
		okularcore.1:${PORTSDIR}/graphics/okular

CONFLICTS=	kdegraphics-4.[0-6].*

USE_KDE4=	kdehier kdelibs kdeprefix automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	gui qmake_build moc_build uic_build rcc_build
USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
