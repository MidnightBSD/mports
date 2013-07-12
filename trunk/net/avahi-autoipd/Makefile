# $MidnightBSD: mports/net/avahi-autoipd/Makefile,v 1.8 2012/12/20 13:14:46 laffer1 Exp $

PORTREVISION=	1
CATEGORIES=	net
PKGNAMESUFFIX=	-autoipd

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPv4LL network address configuration daemon
LICENSE=	lgpl

USERS=		avahi-autoipd
GROUPS=		${USERS}

LIB_DEPENDS=	avahi-common.3:${PORTSDIR}/net/avahi-app

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-autoipd
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

MAKE_ARGS+=	-I /usr/include

AVAHI_SLAVE=	autoipd

MAN8=		avahi-autoipd.8
USE_GNOME=	gnomehack  ltverhack intltool
PKGINSTALL=	${.CURDIR}/pkg-install

.include "${MASTERDIR}/Makefile"
