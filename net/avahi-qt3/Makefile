# $MidnightBSD: mports/net/avahi-qt3/Makefile,v 1.3 2011/12/15 00:57:52 laffer1 Exp $

PORTREVISION=	0
CATEGORIES=	net
PKGNAMESUFFIX=	-qt3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 3 bindings to the Avahi mDNS system
LICENSE=	lgpl

LIB_DEPENDS=	avahi-common.3:${PORTSDIR}/net/avahi-app

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-qt
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	qt3
USE_GNOME=	gnomehack ltverhack intltool
USE_QT_VER=	3
AVAHI_PKGCONFIG=	avahi-qt3.pc

.include "${MASTERDIR}/Makefile"
