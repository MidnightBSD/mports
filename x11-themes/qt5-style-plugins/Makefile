# $MidnightBSD$

PORTNAME=	qt5-style-plugins
PORTVERSION=	5.0.0
CATEGORIES=	x11-themes
MASTER_SITES=	QT/community_releases/additional_qt_src_pkgs/
DISTNAME=	qtstyleplugins-src-${PORTVERSION}
DIST_SUBDIR=	KDE/Qt/addons

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional Styles for Qt 5 and KDE

LICENSE=	lgpl2.1

USES=		qmake qt:5
USE_QT=		buildtools_build core gui widgets
USE_GL+=	gl

WRKSRC=		${WRKDIR}/qtstyleplugins-src-${PORTVERSION}

.include <bsd.port.mk>
