# $MidnightBSD$
# $FreeBSD: head/print/cups-bjnp/Makefile 410825 2016-03-11 11:53:42Z tijl $

PORTNAME=	cups-bjnp
PORTVERSION=	2.0
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CUPS backend for Canon USB over IP protocol

LICENSE=	unknown

LIB_DEPENDS=	libcups.so:${PORTSDIR}/print/cups

GNU_CONFIGURE=	yes
# Just to avoid a tautological pointer compare in bjnp-commands.c:187
CONFIGURE_ARGS+=	--disable-Werror
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
