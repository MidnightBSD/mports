# $MidnightBSD$
# $FreeBSD: ports/graphics/libksane/Makefile,v 1.2 2012/02/16 15:56:59 ashish Exp $

PORTNAME=	libksane
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SANE library interface for KDE
LICENSE=	gpl2

LIB_DEPENDS=	sane.1:${PORTSDIR}/graphics/sane-backends

CONFLICTS=	kdegraphics-4.[0-6].*

USE_KDE4=	kdehier kdelibs kdeprefix automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib moc_build qmake_build rcc_build uic_build
USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes

pre-configure:
	${REINPLACE_CMD} -e '/pkgconfig/ s/$${LIB_INSTALL_DIR}/libdata/' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
