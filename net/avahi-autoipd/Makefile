# New ports collection makefile for:	avahi-autoipd
# Date created:				31 July 2007
# Whom:					Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/net/avahi-autoipd/Makefile,v 1.1 2008/02/17 06:51:06 laffer1 Exp $
# $FreeBSD: ports/net/avahi-autoipd/Makefile,v 1.3 2007/12/23 20:29:49 marcus Exp $
#    $MCom: ports/net/avahi-autoipd/Makefile,v 1.1 2007/07/31 18:24:12 ahze Exp $

PORTREVISION=	0
CATEGORIES=	net
PKGNAMESUFFIX=	-autoipd

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPv4LL network address configuration daemon
LICENSE=	lgpl

LIB_DEPENDS=	avahi-common.3:${PORTSDIR}/net/avahi-app

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-autoipd
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	autoipd

MAN8=		avahi-autoipd.8
USE_GNOME=	gnomehack gnometarget ltverhack intltool
PKGINSTALL=	${.CURDIR}/pkg-install

.include "${MASTERDIR}/Makefile"
