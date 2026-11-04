PORTNAME=	networkmanager-qt
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
CATEGORIES=	net-mgmt kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt wrapper for NetworkManager API

LIB_DEPENDS=	libnm.so:net-mgmt/networkmanager-shim

LICENSE=	bsd3 CC0-1.0 gpl2 gpl3 lgpl2.1 lgpl3
LICENSE_COMB=	multi
LICENSE_FILE_bsd3	= ${WRKSRC}/LICENSES/BSD-3-Clause.txt
LICENSE_FILE_CC0-1.0	= ${WRKSRC}/LICENSES/CC0-1.0.txt
LICENSE_FILE_gpl2	= ${WRKSRC}/LICENSES/GPL-2.0-only.txt
LICENSE_FILE_gpl3	= ${WRKSRC}/LICENSES/GPL-3.0-only.txt
LICENSE_FILE_lgpl2.1	= ${WRKSRC}/LICENSES/LGPL-2.1-only.txt
LICENSE_FILE_lgpl3	= ${WRKSRC}/LICENSES/LGPL-3.0-only.txt

USES=		cmake gettext-runtime kde:6 pkgconfig qt:6 tar:xz
USE_KDE=	ecm:build
USE_QT=		base declarative

CMAKE_ARGS=	-DKF_IGNORE_PLATFORM_CHECK=true

.include <bsd.port.mk>
