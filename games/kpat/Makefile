PORTNAME=	kpat
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	games kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	${${PORTNAME:tu}_DESC}
WWW=		http://www.kde.org/applications/games/kpatience/

LIB_DEPENDS=	libfreecell-solver.so:games/freecell-solver \
		libblack_hole_solver.so:games/black-hole-solver

USES=		cmake compiler:c++11-lang desktop-file-utils gettext kde:6 \
		pkgconfig qt:6 shared-mime-info tar:xz
USE_KDE=	attica auth codecs completion config configwidgets coreaddons \
		crash dbusaddons guiaddons i18n iconthemes itemviews \
		kdeclarative kio libkdegames newstuff notifyconfig phonon \
		service textwidgets widgetsaddons xmlgui \
		ecm:build
USE_QT=		base declarative
CMAKE_ON=	WITH_BH_SOLVER

OPTIONS_DEFINE=	DOCS

.include <${.CURDIR}/../kdegames/Makefile.common>
.include <bsd.port.mk>
