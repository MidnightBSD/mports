# New ports collection makefile for:	avahi-qt4
# Date created:				26 October 2007
# Whom:					Michael Johnson <ahze@FreeBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/net/avahi-qt4/Makefile,v 1.7 2008/07/03 21:53:55 mezz Exp $
#

PORTREVISION=	1
CATEGORIES=	net
PKGNAMESUFFIX=	-qt4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 4 bindings to the Avahi mDNS system
LICENSE=	lgpl

LIB_DEPENDS=	libavahi-common.so:${PORTSDIR}/net/avahi-app

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-qt
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	qt4
USE_QT4=	corelib moc_build
AVAHI_PKGCONFIG=	avahi-qt4.pc

.include "${MASTERDIR}/Makefile"
