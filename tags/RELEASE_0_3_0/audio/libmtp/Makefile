# $MidnightBSD: mports/audio/libmtp/Makefile,v 1.1 2008/09/11 05:02:48 laffer1 Exp $

PORTNAME=	libmtp
PORTVERSION=	0.3.1
CATEGORIES=	audio
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Media Transfer Protocol (MTP) library
LICENSE=	lgpl

LIB_DEPENDS=	usb:${PORTSDIR}/devel/libusb \
		iconv:${PORTSDIR}/converters/libiconv

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	LDFLAGS="${LDFLAGS}" CPPFLAGS="${CPPFLAGS}"
USE_GNOME=	gnomehack
USE_LDCONFIG=	yes

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib -liconv

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS/s|doc||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
