# $MidnightBSD: mports/devel/libffi/Makefile,v 1.6 2012/04/01 04:45:19 laffer1 Exp $

PORTNAME=	libffi
PORTVERSION=	3.0.11
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	SOURCEWARE
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface
LICENSE=	mit

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack
USE_PKGCONFIG=	build
PLIST_SUB=	PORTVERSION=${PORTVERSION}

INFO=		libffi

MAN3=		ffi.3 ffi_call.3 ffi_prep_cif.3 ffi_prep_cif_var.3

post-install:
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffi.h ${PREFIX}/include/
	@${LN} -sf ../lib/libffi-${PORTVERSION}/include/ffitarget.h ${PREFIX}/include/


.include <bsd.port.mk>
