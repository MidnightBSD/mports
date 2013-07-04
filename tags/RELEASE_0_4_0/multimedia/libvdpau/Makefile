# $MidnightBSD$
# $FreeBSD: ports/multimedia/libvdpau/Makefile,v 1.3 2011/12/26 16:12:26 tabthorpe Exp $

PORTNAME=	libvdpau
PORTVERSION=	0.4.1
CATEGORIES=	multimedia
MASTER_SITES=	http://people.freedesktop.org/~aplattner/vdpau/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VDPAU wrapper and tracing library
LICENSE=	mit

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-documentation
USE_GMAKE=	yes
USE_XORG=	dri2proto xext
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
CFLAGS+=	-DDEBUG
.endif

.if defined(STRIP) && ${STRIP} != ""
INSTALL_TARGET=	install-strip
.endif

post-patch:	.SILENT
	${REINPLACE_CMD} 's|$$(libdir)/\(pkgconfig\)|$$(prefix)/libdata/\1|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.post.mk>
