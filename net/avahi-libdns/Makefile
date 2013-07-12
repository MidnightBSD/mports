# $MidnightBSD: mports/net/avahi-libdns/Makefile,v 1.4 2012/12/20 13:16:21 laffer1 Exp $

PORTREVISION=	1
CATEGORIES=	net
PKGNAMESUFFIX=	-libdns

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	mDNSResponder compatibility from Avahi
LICENSE=	lgpl

LIB_DEPENDS=	avahi-common.3:${PORTSDIR}/net/avahi-app

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-compat-libdns_sd
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	libdns
AVAHI_PKGCONFIG=avahi-compat-libdns_sd.pc

CONFLICTS=	mDNSResponder-[0-9]*

.include "${MASTERDIR}/Makefile"
