# $MidnightBSD$
# $FreeBSD: head/x11/libinput/Makefile 433898 2017-02-11 17:51:19Z rezny $

PORTNAME=	libinput
PORTVERSION=	1.6.0
CATEGORIES=	x11
MASTER_SITES=	http://freedesktop.org/software/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic input library

BUILD_DEPENDS=	v4l_compat>=0:multimedia/v4l_compat
LIB_DEPENDS=	libevdev.so:devel/libevdev \
		libepoll-shim.so:devel/libepoll-shim \
		libwacom.so:x11/libwacom \
		libudev.so:devel/libudev-devd \
		libmtdev.so:devel/libmtdev

USES=		autoreconf gmake libtool pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include/libepoll-shim
INSTALL_TARGET=	install-strip

post-patch:
	${REINPLACE_CMD} -e 's|program_invocation_short_name|getprogname()|' \
	    ${WRKSRC}/tools/libinput-list-devices.c \
	    ${WRKSRC}/tools/ptraccel-debug.c ${WRKSRC}/tools/shared.c

.include <bsd.port.mk>
