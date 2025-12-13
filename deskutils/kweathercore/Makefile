PORTNAME=	kweathercore
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	deskutils kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to facilitate retrieval of weather information
WWW=		https://invent.kde.org/libraries/kweathercore

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/LICENSES/LGPL-2.0-or-later.txt

USES=		cmake gettext kde:6 kfhack qt:6 tar:xz
USE_KDE=	holidays i18n \
		ecm:build
USE_QT=		base positioning
USE_LDCONFIG=	yes

.include <bsd.port.mk>
