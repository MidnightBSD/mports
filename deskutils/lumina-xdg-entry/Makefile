PORTNAME=	lumina-xdg-entry
DISTVERSIONPREFIX=	v
DISTVERSION=	1.3.0
DISTVERSIONSUFFIX=	-p1
PORTREVISION=	2
CATEGORIES=	deskutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XDG desktop entry creator from the Lumina Desktop

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/../../../LICENSE

OPTIONS_DEFINE=	I18N
OPTIONS_DEFAULT=I18N
I18N_DESC=	Install localization files

.include <bsd.mport.options.mk>

MAKE_JOBS_UNSAFE=yes

USES=		compiler:c++11-lang qmake qt:5
USE_QT=		core gui widgets network svg \
		buildtools_build x11extras concurrent multimedia
USE_GITHUB=	yes
GH_ACCOUNT=	trueos
GH_PROJECT=	lumina
WRKSRC_SUBDIR=	src-qt5/desktop-utils/${PORTNAME}

.if${PORT_OPTIONS:MI18N}
USE_QT+=	linguist_build
QMAKE_ARGS+=	CONFIG+=WITH_I18N
.endif

.include <bsd.port.mk>
