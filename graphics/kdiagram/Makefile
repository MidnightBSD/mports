PORTNAME=	kdiagram
DISTVERSION=	2.8.0
PORTREVISION=	1
CATEGORIES=	graphics kde
MASTER_SITES=	KDE/stable/${PORTNAME}/${DISTVERSION}/
DIST_SUBDIR=	KDE/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to create business diagrams
WWW=		https://projects.kde.org/kdiagram

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE.GPL.txt

USES=		cmake compiler:c++11-lang kde:5 qt:5 tar:xz
USE_KDE=	ecm:build
USE_QT=		core gui linguisttools printsupport sql svg widgets \
		buildtools:build qmake:build

PLIST_SUB=	SHLIB_VER="${PORTVERSION}" \
		SHLIB_SHVER="${PORTVERSION:R:R}"

PORTSCOUT=	limit:^2 # limit for Qt5

.include <bsd.port.mk>
