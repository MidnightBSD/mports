PORTREVISION=	1
CATEGORIES=	net
PKGNAMESUFFIX=	-gtk3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gtk+ 3 library to the Avahi mDNS system

LICENSE=	lgpl2.1+

LIB_DEPENDS=	libavahi-common.so:net/avahi-app \
		libgdbm.so:databases/gdbm \
		libharfbuzz.so:print/harfbuzz
RUN_DEPENDS=	avahi-header>=0.8:net/avahi-header

MASTERDIR=	${.CURDIR}/../avahi-app
BUILD_WRKSRC=	${WRKSRC}/avahi-ui
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

AVAHI_SLAVE=	gtk3
AVAHI_PKGCONFIG=avahi-ui-gtk3.pc

USE_GNOME+=	cairo gdkpixbuf gtk30

do-build:
	${DO_MAKE_BUILD} -C ${WRKSRC}/avahi-common
	${DO_MAKE_BUILD} -C ${WRKSRC}/avahi-client
	${DO_MAKE_BUILD} -C ${WRKSRC}/avahi-glib
	${DO_MAKE_BUILD} -C ${WRKSRC}/avahi-ui libavahi-ui-gtk3.la
	${DO_MAKE_BUILD} -C ${WRKSRC}/avahi-discover-standalone

do-install:
	@(cd ${WRKSRC}/avahi-discover-standalone; ${MAKE_CMD} ${MAKE_ARGS} ${FAKE_MAKEARGS} install-binPROGRAMS install-interfacesDATA)
#	@(cd ${WRKSRC}/avahi-ui; ${MAKE_CMD} ${MAKE_ARGS} ${FAKE_MAKEARGS} install-libLTLIBRARIES)
	@(cd ${WRKSRC}/avahi-ui; ${MAKE_CMD} ${MAKE_ARGS} ${FAKE_MAKEARGS} install-binPROGRAMS install-desktopDATA install-exec-local)

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libavahi-ui-gtk3.so

.include "${MASTERDIR}/Makefile"
