PORTNAME=	ki18n
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

COMMENT=	Advanced internationalization framework
MAINTAINER=	ports@MidnightBSD.org

BUILD_DEPENDS=	iso-codes>=0:misc/iso-codes
RUN_DEPENDS=	iso-codes>=0:misc/iso-codes

USES=		cmake gettext kde:6 kfhack pkgconfig qt:6 tar:xz
USE_KDE=	ecm:build
USE_QT=		base declarative tools:build

.include <bsd.port.mk>
