PORTREVISION=	0
CATEGORIES=	net
PKGNAMESUFFIX=	-qt5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5 bindings to the Avahi mDNS system

LIB_DEPENDS=	libavahi-common.so:net/avahi-app

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-qt
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	qt5
USES=		compiler:c++11-lang qt:5
USE_QT=		core buildtools:build
AVAHI_PKGCONFIG=avahi-qt5.pc

.include "${MASTERDIR}/Makefile"
