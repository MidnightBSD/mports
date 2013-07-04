# New ports collection makefile for:	libiconv
# Date created:				21 August 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/converters/psiconv/Makefile,v 1.3 2011/02/02 20:09:16 laffer1 Exp $
# $FreeBSD: ports/converters/psiconv/Makefile,v 1.15 2007/02/01 02:41:22 kris Exp $
#

PORTNAME=	psiconv
PORTVERSION=	0.9.8
PORTREVISION=	1
CATEGORIES=	converters devel
MASTER_SITES=	http://software.frodo.looijaard.name/psiconv/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A conversion utility to convert Psion 5(MX) files into other formats
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
USE_GETOPT_LONG=yes
USE_LDCONFIG=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-imagemagick=no
CONFIGURE_TARGET=	${MACHINE_ARCH}-unknown-freebsd7.0

MAN1=		psiconv.1 psiconv-config.1

.include <bsd.port.mk>
