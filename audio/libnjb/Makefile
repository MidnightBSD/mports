# $MidnightBSD: mports/audio/libnjb/Makefile,v 1.3 2011/02/02 20:03:22 laffer1 Exp $
# $FreeBSD: ports/audio/libnjb/Makefile,v 1.7 2008/03/20 13:29:31 gahr Exp $

PORTNAME=	libnjb
PORTVERSION=	2.2.6
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library, API for communicating with Creative and Dell audio players
LICENSE=	bsd3

LIB_DEPENDS=	usb-0.1.8:${PORTSDIR}/devel/libusb

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if !defined(NOPORTDOCS)
BUILD_DEPENDS+=	doxygen:${PORTSDIR}/devel/doxygen
PLIST_SUB=	PORTVERSION=${PORTVERSION}
.else
NODOC=		/^SUBDIRS/s|doc||
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|;\
		${NODOC}' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e '/^SHOW_DIRECTORIES/d' ${WRKSRC}/doc/Doxyfile.in

.include <bsd.port.post.mk>
