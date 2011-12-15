# New ports collection makefile for:	avahi-qt3
# Date created:				12 April 2007
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/net/avahi-qt3/Makefile,v 1.2 2008/04/11 21:12:39 laffer1 Exp $
# $FreeBSD: ports/net/avahi-qt3/Makefile,v 1.7 2007/12/23 20:29:49 marcus Exp $
#    $MCom: ports/net/avahi-qt3/Makefile,v 1.1 2007/07/31 18:24:12 ahze Exp $

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
USE_GNOME=	gnomehack  ltverhack intltool
USE_QT_VER=	3
AVAHI_PKGCONFIG=	avahi-qt3.pc

.include "${MASTERDIR}/Makefile"
