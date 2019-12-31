PORTNAME=	lumina-fileinfo
PORTVERSION=	1.4.1
CATEGORIES=	deskutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File properties utility from the Lumina Desktop

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/../../../LICENSE

CONFLICTS_INSTALL=	lumina-1.2.*

MAKE_JOBS_UNSAFE=yes

USES=		compiler:c++11-lang qmake qt:5
USE_QT=		core gui widgets network svg \
		buildtools_build x11extras concurrent multimedia
USE_GITHUB=	yes
GH_ACCOUNT=	trueos
GH_PROJECT=	lumina
GH_TAGNAME=	b6536c1547571ae8dd0618bed752e2e0025bf2a7
WRKSRC_SUBDIR=	src-qt5/desktop-utils/${PORTNAME}

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_QMAKE_ON=	CONFIG+=WITH_I18N
NLS_USE=	QT=linguist_build

.include <bsd.port.mk>
