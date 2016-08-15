# $MidnightBSD$

PORTREVISION=	1
CATEGORIES=	net
PKGNAMESUFFIX=	-gtk

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gtk+ tools and bindings to the Avahi mDNS system
LICENSE=	lgpl

LIB_DEPENDS=	libavahi-common.so:${PORTSDIR}/net/avahi-app
RUN_DEPENDS=	avahi-header>=0.6:${PORTSDIR}/net/avahi-header

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-ui
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	gtk
AVAHI_PKGCONFIG=avahi-ui.pc

MANPAGES=	bssh.1

USE_GNOME+=	libglade2

post-build:
	@(cd ${WRKSRC}/avahi-discover-standalone; \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${ALL_TARGET})

post-install:
	@(cd ${WRKSRC}/avahi-discover-standalone; \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET})
	${LN} -sf man/man1/bssh.1 ${PREFIX}/man/man1/bvnc.1
	${LN} -sf man/man1/bssh.1 ${PREFIX}/man/man1/bshell.1
	@${STRIP_CMD} ${PREFIX}/lib/libavahi-ui.so.0


.include "${MASTERDIR}/Makefile"
