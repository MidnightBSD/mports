# $MidnightBSD$
# $FreeBSD: ports/devel/liboil/Makefile,v 1.25 2007/03/24 21:50:39 marcus Exp $

PORTNAME=	liboil
PORTVERSION=	0.3.17
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	http://liboil.freedesktop.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of optimized inner loops

LICENSE=	bsd2 bsd3 mit
LICENSE_COMB=	multi

USES=		libtool pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--disable-glib
INSTALL_TARGET=	install-strip
CFLAGS:=	${CFLAGS:N-O*} -O2

post-patch:
	@${REINPLACE_CMD} -e 's|\\$$(libdir)/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
