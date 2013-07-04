# ex:ts=8
# Ports collection makefile for:	libfame
# Date created:			Mar 23, 2002
# Whom:				ijliao
#
# $MidnightBSD: mports/multimedia/libfame/Makefile,v 1.5 2011/02/02 21:11:11 laffer1 Exp $
# $FreeBSD: ports/multimedia/libfame/Makefile,v 1.23 2006/06/09 18:59:19 ahze Exp $
#

PORTNAME=	libfame
PORTVERSION=	0.9.1
PORTREVISION=	3
CATEGORIES=	multimedia
MASTER_SITES=	SF/fame/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A video encoding library
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0

MAN3=	fame_close.3 fame_encode_frame.3 fame_get_object.3 fame_init.3 \
	fame_open.3 fame_register.3 fame_unregister.3 fame_encode_slice.3 \
	fame_start_frame.3 fame_end_frame.3

OPTIONS=	SSE "SSE optimized routines (no effect in this release)" off \
		MMX "MMX optimized routines" on

.include <bsd.port.pre.mk>

.if defined(WITH_SSE)
CONFIGURE_ARGS+=	--enable-sse
.endif

.if defined(WITHOUT_MMX)
CONFIGURE_ARGS+=	--disable-mmx
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|$${CONFIG_SHELL-/bin/sh} $$ac_aux_dir|$$ac_aux_dir|' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} \
		-e 's|AC_DEFUN(AM_PATH_LIBFAME|AC_DEFUN([AM_PATH_LIBFAME]|g' \
		${WRKSRC}/libfame.m4 ${WRKSRC}/libfame.m4.in

.include <bsd.port.post.mk>
