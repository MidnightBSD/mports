PORTNAME=	libkeduvocdocument
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	misc kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for reading and writing vocabulary files
WWW=		https://edu.kde.org/

USES=		cmake compiler:c++11-lang gettext kde:6 qt:6 tar:xz
USE_KDE=	archive config coreaddons i18n kio service \
		ecm:build
USE_QT=		base

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
