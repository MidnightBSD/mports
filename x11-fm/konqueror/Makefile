PORTNAME=	konqueror
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	x11-fm www kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE web browser and file manager
WWW=		https://konqueror.org/

USES=		cmake compiler:c++11-lang cpe desktop-file-utils gettext kde:6 \
		localbase:ldflags pkgconfig qt:6 tar:xz xorg
USE_KDE=	activities archive auth bookmarks codecs completion config \
		configwidgets coreaddons crash dbusaddons guiaddons i18n \
		iconthemes itemviews jobwidgets kcmutils kdesu kio \
		notifications parts pty service solid sonnet textwidgets \
		unitconversion wallet widgetsaddons windowsystem xmlgui \
		ecm:build
USE_QT=		base webengine
USE_XORG=	ice sm x11 xext

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
