# $MidnightBSD$

PORTNAME=	avahi
PORTVERSION=	0.6.31
PORTREVISION?=	1
MASTER_SITES=   # none
CATEGORIES?=	net dns
DISTFILES=      # none
EXTRACT_ONLY=   # none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	"meta-port" for the Avahi service discovery suite

LICENSE=	lgpl

RUN_DEPENDS=	avahi-app>=0.6.31:${PORTSDIR}/net/avahi-app

NO_BUILD=       yes
NO_MTREE=       yes

OPTIONS_DEFINE=	AUTOIPD GTK MONO QT4 PYTHON
OPTIONS_DEFAULT=AUTOIPD GTK
AUTOIPD_DESC=	IPv4LL network address configuration daemon
GTK_DESC=	Gtk+ tools and bindings
LIBDNS_DESC=	Apple's mDNSResponder compatibility library

AUTOIPD_RUN_DEPENDS=	avahi-autoipd:${PORTSDIR}/net/avahi-autoipd
GTK_RUN_DEPENDS=	avahi-discover-standalone:${PORTSDIR}/net/avahi-gtk
#LIBDNS_RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/avahi-compat-libdns_sd.pc:${PORTSDIR}/net/avahi-libdns
MONO_RUN_DEPENDS=	${LOCALBASE}/lib/mono/avahi-sharp/avahi-sharp.dll:${PORTSDIR}/net/avahi-sharp
QT4_RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/avahi-qt4.pc:${PORTSDIR}/net/avahi-qt4
PYTHON_RUN_DEPENDS=	avahi-bookmarks:${PORTSDIR}/net/py-avahi

do-install: build
	@${DO_NADA}

.include <bsd.port.mk>
