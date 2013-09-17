# $MidnightBSD$

PORTNAME=	libmspack
PORTVERSION=	0.2
CATEGORIES=	archivers
MASTER_SITES=	http://www.cabextract.org.uk/libmspack/
DISTNAME=	${PORTNAME}-${PORTVERSION}alpha

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for Microsoft compression formats
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=  yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd7.0
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's,$$(libdir)/pkgconfig,@prefix@/libdata/pkgconfig,g' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
