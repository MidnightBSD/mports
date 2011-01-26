# New ports collection makefile for:   ffcall
# Date created:        21 February 2001
# Whom:                jagapen@home.com
#
# $MidnightBSD: mports/devel/ffcall/Makefile,v 1.1 2006/09/20 16:42:06 laffer1 Exp $
# $FreeBSD: ports/devel/ffcall/Makefile,v 1.22 2006/07/08 05:15:07 dinoex Exp $
#

PORTNAME=	ffcall
PORTVERSION=	1.10
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.santafe.edu/pub/gnu/
MASTER_SITES+=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign function call libraries
LICENSE=	gpl2

USE_GMAKE=	yes
GNU_CONFIGURE=	yes

MAN3=		avcall.3 callback.3 trampoline.3 trampoline_r.3 vacall.3
MANCOMPRESSED=	no
CFLAGS+=	-fPIC

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CONFIGURE_TARGET=	x86_64-portbld-freebsd6.0
.else
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd6.0
.endif

.include <bsd.port.post.mk>
