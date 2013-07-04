# $MidnightBSD: mports/net/fping/Makefile,v 1.3 2009/06/09 20:48:43 crash Exp $

PORTNAME=	fping
PORTVERSION=	3.4
CATEGORIES=	net ipv6
MASTER_SITES=	http://fping.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quickly ping N hosts w/o flooding the network
LICENSE=        bsd3

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--bindir="${PREFIX}/sbin"
MAN8=		fping.8

.if defined(WITH_IPV6)
# IPv6 not enabled by default, as it does not work together with IPv4.
CFLAGS+=	-DIPV6
.endif

post-install:
	@${STRIP_CMD} ${PREFIX}/sbin/fping
	@${CHMOD} 4555 ${PREFIX}/sbin/fping

.include <bsd.port.mk>
