PORTNAME=	oxygen-sounds
DISTVERSION=	${KDE_PLASMA_VERSION}
CATEGORIES=	audio kde kde-plasma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Oxygen Sound Theme

USES=		cmake:noninja kde:6 qt:6 tar:xz
USE_KDE=	ecm:build
USE_QT=		base:build
NO_ARCH=	yes

CMAKE_ARGS=	-DQT_MAJOR_VERSION=6

.include <bsd.port.mk>
