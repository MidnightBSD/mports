# $MidnightBSD: mports/net/avahi-libdns/Makefile,v 1.3 2008/05/24 06:18:56 laffer1 Exp $

PORTREVISION=	0
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
