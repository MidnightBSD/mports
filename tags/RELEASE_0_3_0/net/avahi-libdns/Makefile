# New ports collection makefile for:	avahi-libdns
# Date created:				31 July 2007
# Whom:					Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/net/avahi-libdns/Makefile,v 1.2 2008/04/11 21:08:02 laffer1 Exp $
# $FreeBSD: ports/net/avahi-libdns/Makefile,v 1.2 2007/10/27 14:18:24 ahze Exp $
#

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
