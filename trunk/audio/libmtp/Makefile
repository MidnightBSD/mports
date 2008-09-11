# New ports collection makefile for:	libmtp
# Date created:							3 December 2006
# Whom:								Petar Zhivkov Petrov (pesho.petrov@gmail.com)
#
# $MidnightBSD$
# $FreeBSD: ports/audio/libmtp/Makefile,v 1.10 2008/03/31 07:54:14 rafan Exp $
#

PORTNAME=	libmtp
PORTVERSION=	0.2.6.1
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

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
