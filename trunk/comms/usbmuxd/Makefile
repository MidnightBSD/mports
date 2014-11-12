# $MidnightBSD$

PORTNAME=	usbmuxd
DISTVERSION=	1.0.9-alpha1
CATEGORIES=	comms
MASTER_SITES=	http://www.libimobiledevice.org/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Daemon for multiplexing connections over USB to iPhone/iPod Touch

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

LIB_DEPENDS=	libplist.so:${PORTSDIR}/devel/libplist \
		libimobiledevice.so:${PORTSDIR}/comms/libimobiledevice

USE_GITHUB=	yes
GH_ACCOUNT=	libimobiledevice
GH_TAGNAME=	${GH_COMMIT}
GH_COMMIT=	2f6d9d5

USES=		autoreconf libtool pathfix pkgconfig tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-systemd \
		libusb_CFLAGS="-I/usr/include" \
		libusb_LIBS="-lusb"

PLIST_FILES=	sbin/usbmuxd

PORTDOCS=	AUTHORS README

OPTIONS_DEFINE=	DOCS

post-patch:
# TODO: add devd(8) rule.
	@${REINPLACE_CMD} \
		-e '/*cygwin*/ s,),|*bsd*),' \
		${WRKSRC}/configure.ac

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
