PORTNAME=	kcalendarcore
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
PORTEPOCH=	1
CATEGORIES=	net kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE calendar access library

LICENSE=	lgpl2.1

LIB_DEPENDS=	libical.so:devel/libical

USES=		bison cmake compiler:c++11-lib gettext kde:5 qt:5 tar:xz
USE_KDE=	init \
		ecm:build
USE_QT=		core gui \
		buildtools:build qmake:build
USE_LDCONFIG=	yes

DESCR=		${.CURDIR:H:H}/deskutils/kdepim/pkg-descr

.include <bsd.port.mk>
