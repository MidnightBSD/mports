PORTNAME=	libkexiv2
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	graphics kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Exiv2 library interface for KDE
WWW=		https://www.digikam.org/

LIB_DEPENDS=	libexiv2.so:graphics/exiv2

USES=		cmake compiler:c++11-lang kde:6 pkgconfig qt:6 tar:xz
USE_KDE=	ecm:build
USE_QT=		base

USE_LDCONFIG=	yes

.include <bsd.port.mk>
