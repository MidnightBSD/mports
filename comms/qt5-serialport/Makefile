PORTNAME=	serialport
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	comms
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt functions to access serial ports

USES=		compiler:c++11-lang libtool perl5 qmake qt-dist:5,serialport
USE_PERL5=	extract
USE_QT=		core buildtools:build
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
