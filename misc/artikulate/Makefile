PORTNAME=	artikulate
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	misc education kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pronunciation trainer for KDE
WWW=		https://edu.kde.org/

USES=		cmake compiler:c++11-lang gettext kde:5 qt:5 tar:xz
USE_KDE=	archive attica auth codecs config configwidgets coreaddons \
		crash i18n kdeclarative newstuff service widgetsaddons xmlgui \
		doctools:build ecm:build
USE_QT=		core dbus declarative gui multimedia network sql testlib \
		widgets xml xmlpatterns \
		buildtools:build qmake:build
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
