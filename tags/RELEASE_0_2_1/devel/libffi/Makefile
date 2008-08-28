# New ports collection makefile for:	libffi
# Date created:			14, June, 1998
# Whom:				Horance Chou <horance@freedom.ie.cycu.edu.tw>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/libffi/Makefile,v 1.25 2008/04/04 13:09:46 pav Exp $
#

PORTNAME=	libffi
PORTVERSION=	3.0.4
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

.include <bsd.port.mk>
