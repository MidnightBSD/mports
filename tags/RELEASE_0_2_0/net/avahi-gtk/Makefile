# New ports collection makefile for:	avahi-gtk
# Date created:				31 July 2007
# Whom:					Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/net/avahi-gtk/Makefile,v 1.1 2008/02/17 07:21:59 laffer1 Exp $
# $FreeBSD: ports/net/avahi-gtk/Makefile,v 1.4 2007/12/23 20:29:49 marcus Exp $
#    $MCom: ports/net/avahi-gtk/Makefile,v 1.2 2007/09/12 12:41:45 ahze Exp $

PORTREVISION=	0
CATEGORIES=	net
PKGNAMESUFFIX=	-gtk

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gtk+ tools and bindings to the Avahi mDNS system
LICENSE=	lgpl

LIB_DEPENDS=	avahi-common.3:${PORTSDIR}/net/avahi-app

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-ui
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	gtk
AVAHI_PKGCONFIG=avahi-ui.pc

MAN1+=		bssh.1
MLINKS+=	bssh.1 bvnc.1 \
		bssh.1 bshell.1
USE_GNOME=	gnomehack gnometarget ltverhack intltool libglade2

post-build:
	@(cd ${WRKSRC}/avahi-discover-standalone; \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${ALL_TARGET})

post-install:
	@(cd ${WRKSRC}/avahi-discover-standalone; \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET})

.include "${MASTERDIR}/Makefile"
