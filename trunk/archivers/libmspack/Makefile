# New ports collection makefile for:	libmspack
# Date created:				25 Nov 2004
# Whom:					Max Khon <fjoe@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/archivers/libmspack/Makefile,v 1.7 2007/02/01 02:41:15 kris Exp $
#

PORTNAME=	libmspack
PORTVERSION=	0.0.20040308
PORTREVISION=	3
CATEGORIES=	archivers
MASTER_SITES=	http://www.kyz.uklinux.net/downloads/
DISTNAME=	${PORTNAME}-${PORTVERSION}alpha

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for Microsoft compression formats

USE_AUTOTOOLS=	libtool:15
USE_GETOPT_LONG=	yes
GNU_CONFIGURE=  yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
INSTALLS_SHLIB=	yes

post-patch:
	@${REINPLACE_CMD} -e 's,\*this,*self,'\
		-e 's,@param\( *\)this,@param\1self,' ${WRKSRC}/mspack/mspack.h

.include <bsd.port.mk>
