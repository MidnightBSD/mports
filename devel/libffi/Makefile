# $MidnightBSD: mports/devel/libffi/Makefile,v 1.1 2008/07/08 01:56:05 laffer1 Exp $

PORTNAME=	libffi
PORTVERSION=	3.0.8
CATEGORIES=	devel
MASTER_SITES=	ftp://sourceware.org/pub/libffi/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface
LICENSE=	mit

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
PLIST_SUB=	PORTVERSION=${PORTVERSION}

INFO=		libffi

MAN3=		ffi.3 ffi_call.3 ffi_prep_cif.3

post-install:
	${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffi.h ${PREFIX}/include/
	${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffitarget.h ${PREFIX}/include/


.include <bsd.port.mk>
