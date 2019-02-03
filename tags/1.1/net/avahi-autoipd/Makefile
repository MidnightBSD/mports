# $MidnightBSD$

PORTREVISION=	2
CATEGORIES=	net
PKGNAMESUFFIX=	-autoipd

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPv4LL network address configuration daemon
LICENSE=	lgpl

USERS=		avahi-autoipd
GROUPS=		${USERS}

LIB_DEPENDS=	libavahi-common.so:${PORTSDIR}/net/avahi-app

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-autoipd
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

MAKE_ARGS+=	-I /usr/include

AVAHI_SLAVE=	autoipd

PKGINSTALL=	${.CURDIR}/pkg-install
MANPAGES=	avahi-autoipd.8

.include "${MASTERDIR}/Makefile"
