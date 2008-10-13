# ex:ts=8
# New ports collection makefile for:	libgmp3
# Date created:			Jan 11, 2001
# Whom:				Ying-Chieh Liao <ijliao@FreeBSD.org>
#
# $MidnightBSD: mports/math/libgmp4/Makefile,v 1.1 2006/09/21 14:07:00 laffer1 Exp $
# $FreeBSD: ports/math/libgmp4/Makefile,v 1.29 2006/05/12 07:45:39 ale Exp $
#

PORTNAME=	libgmp
PORTVERSION=	4.2.1
PORTREVISION=	1
CATEGORIES=	math devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	gmp
DISTNAME=	gmp-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A free library for arbitrary precision arithmetic
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_ARGS=	--enable-cxx
INSTALLS_SHLIB=	yes

INFO=		gmp

post-extract:
	@${RM} -f ${WRKSRC}/doc/gmp.info*

.include <bsd.port.mk>
