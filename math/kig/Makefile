PORTNAME=	kig
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
CATEGORIES=	math education kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE interactive geometry application
WWW=		https://www.kde.org/applications/education/kig

LIB_DEPENDS=	${PY_BOOST}

USES=		cmake compiler:c++17-lang desktop-file-utils gettext kde:6 qt:6 \
		shebangfix tar:xz xorg \
		python:run
USE_KDE=	archive configwidgets coreaddons crash i18n iconthemes \
		parts syntaxhighlighting texteditor xmlgui \
		doctools:build ecm:build
USE_QT=		base svg \
		tools:build
USE_XORG=	x11
SHEBANG_FILES=	pykig/pykig.py

OPTIONS_DEFINE=	DOCS

post-patch:
	${REINPLACE_CMD} '/Python_ADDITIONAL_VERSIONS/s|3.10|${PYTHON_VER};3.10|' \
		${WRKSRC}/cmake/modules/FindBoostPython.cmake

.include <bsd.port.mk>
