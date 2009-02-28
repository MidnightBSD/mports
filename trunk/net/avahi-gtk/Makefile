# $MidnightBSD: mports/net/avahi-gtk/Makefile,v 1.2 2008/04/11 21:11:05 laffer1 Exp $

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
