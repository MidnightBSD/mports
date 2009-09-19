# $MidnightBSD: mports/archivers/libmspack/Makefile,v 1.5 2009/03/27 05:52:36 laffer1 Exp $

PORTNAME=	libmspack
PORTVERSION=	0.0.20060920
PORTREVISION=	4
CATEGORIES=	archivers
MASTER_SITES=	http://www.cabextract.org.uk/libmspack/
DISTNAME=	${PORTNAME}-${PORTVERSION}alpha

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for Microsoft compression formats
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=  yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's,\*this,*self,'\
		-e 's,@param\( *\)this,@param\1self,' ${WRKSRC}/mspack/mspack.h

.include <bsd.port.mk>
