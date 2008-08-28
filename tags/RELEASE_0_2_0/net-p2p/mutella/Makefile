# New ports collection makefile for:	mutella
# Date created:				2/12/2001
# Whom:			Dominic Marks <dominic.marks@btinternet.com>
#
# $MidnightBSD$
# $FreeBSD: ports/net-p2p/mutella/Makefile,v 1.17 2006/01/30 21:36:22 pav Exp $
#

PORTNAME=	mutella
PORTVERSION=	0.4.5
PORTEPOCH=	1
CATEGORIES=	net-p2p
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	mutella

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A command line Gnutella client

MAN1=		mutella.1

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

.include <bsd.port.mk>
