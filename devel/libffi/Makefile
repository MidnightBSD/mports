# $MidnightBSD: mports/devel/libffi/Makefile,v 1.4 2011/05/21 21:28:04 laffer1 Exp $

PORTNAME=	libffi
PORTVERSION=	3.0.9
PORTREVISION=	1
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
