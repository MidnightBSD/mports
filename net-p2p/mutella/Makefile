# $MidnightBSD: mports/net-p2p/mutella/Makefile,v 1.3 2009/06/22 17:31:55 laffer1 Exp $

PORTNAME=	mutella
PORTVERSION=	0.4.5
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	net-p2p
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A command line Gnutella client
LICENSE=	gpl2

MAN1=		mutella.1

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

.include <bsd.port.mk>
