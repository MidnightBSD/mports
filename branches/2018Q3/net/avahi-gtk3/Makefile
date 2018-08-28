# Created by: Michael Johnson <ahze@FreeBSD.org>
# $FreeBSD: head/net/avahi-gtk3/Makefile 393404 2015-08-01 20:02:06Z kwm $
# $MidnightBSD$

PORTREVISION=	3
CATEGORIES=	net
PKGNAMESUFFIX=	-gtk3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gtk+ 3 library to the Avahi mDNS system

LICENSE=	lgpl

LIB_DEPENDS=	libavahi-common.so:${PORTSDIR}/net/avahi-app
RUN_DEPENDS=	avahi-header>=0.6:${PORTSDIR}/net/avahi-header

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-ui
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	gtk3
AVAHI_PKGCONFIG=avahi-ui-gtk3.pc

USE_GNOME+=	gtk30

do-build:
	@(cd ${WRKSRC}/avahi-ui; ${MAKE_CMD} libavahi-ui-gtk3.la)

do-install:
	@(cd ${WRKSRC}/avahi-ui; ${MAKE_CMD} ${MAKE_ARGS} ${FAKE_MAKEARGS} install-libLTLIBRARIES)

post-install:
	@${RMDIR} ${PREFIX}/etc/avahi

.include "${MASTERDIR}/Makefile"
