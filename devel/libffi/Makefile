# $MidnightBSD: mports/devel/libffi/Makefile,v 1.5 2011/12/15 00:34:41 laffer1 Exp $

PORTNAME=	libffi
PORTVERSION=	3.0.10
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	ftp://sourceware.org/pub/libffi/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface
LICENSE=	mit

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pkgconfig
PLIST_SUB=	PORTVERSION=${PORTVERSION}

INFO=		libffi

MAN3=		ffi.3 ffi_call.3 ffi_prep_cif.3

post-install:
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffi.h ${PREFIX}/include/
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffitarget.h ${PREFIX}/include/


.include <bsd.port.mk>
