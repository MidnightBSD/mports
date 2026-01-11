PORTNAME=	usbutils
PORTVERSION=	0.91
DISTVERSIONPREFIX=	v
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility for listing USB devices
WWW=		https://github.com/gregkh/usbutils

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	usbhid-dump:sysutils/usbhid-dump \
		${LOCALBASE}/share/usbids/usb.ids:misc/usbids

USES=		autoreconf gmake pkgconfig shebangfix

CONFIGURE_ARGS=	--datadir=${LOCALBASE}/share/usbids --enable-zlib
CONFIGURE_ENV=	LIBUSB_CFLAGS=-I/usr/include LIBUSB_LIBS="-L/usr/lib -lusb"
GNU_CONFIGURE=	yes

PORTDOCS=	AUTHORS ChangeLog NEWS README

GH_ACCOUNT=	gregkh
USE_GITHUB=	yes

PORTSCOUT=	ignore:1

SHEBANG_FILES=	usb-devices

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
