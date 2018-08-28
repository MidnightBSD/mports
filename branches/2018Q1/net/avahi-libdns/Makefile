# $MidnightBSD$

PORTREVISION=	2
CATEGORIES=	net
PKGNAMESUFFIX=	-libdns

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	mDNSResponder compatibility from Avahi

LICENSE=	lgpl

LIB_DEPENDS=	libavahi-common.so:${PORTSDIR}/net/avahi-app

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-compat-libdns_sd
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	libdns
AVAHI_PKGCONFIG=avahi-compat-libdns_sd.pc

CONFLICTS=	mDNSResponder-[0-9]*

.include "${MASTERDIR}/Makefile"
