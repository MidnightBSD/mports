# $MidnightBSD: mports/comms/libticables/Makefile,v 1.5 2011/02/02 20:09:16 laffer1 Exp $

PORTNAME=	libticables
PORTVERSION=	3.9.7
PORTREVISION=	2
CATEGORIES=	comms
MASTER_SITES=		SF/tilp/OldFiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TI calculator link cables library
LICENSE=	lgpl

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_GETTEXT=	yes
USE_GNOME=	gnomehack pkgconfig
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4016
LIB_DEPENDS+=	usb:${PORTSDIR}/devel/libusb
.else
EXTRA_PATCHES=	${FILESDIR}/extra-patch-configure
.endif

.include <bsd.port.post.mk>
