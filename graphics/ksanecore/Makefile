PORTNAME=	ksanecore
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	graphics kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library providing logic to interface scanners
WWW=		https://invent.kde.org/libraries/ksanecore

LIB_DEPENDS=	libsane.so:graphics/sane-backends

USES=		cmake compiler:c++11-lang gettext kde:6 qt:6 tar:xz
USE_KDE=	ecm:build
USE_QT=		base
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
