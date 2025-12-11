PORTNAME=	knewstuff
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	devel kde kde-frameworks

COMMENT=	Framework for downloading and sharing additional application data
MAINTAINER=	ports@MidnightBSD.org

USES=		cmake gettext gl kde:6 kfhack qt:6 tar:xz
USE_GL=		gl opengl
USE_KDE=	archive attica config coreaddons i18n package syndication \
		widgetsaddons \
		ecm:build \
		kirigami2:run
USE_QT=		base declarative

.include <bsd.port.mk>
