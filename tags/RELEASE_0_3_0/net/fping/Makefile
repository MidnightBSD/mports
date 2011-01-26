# ex:ts=8
# Ports collection makefile for:  fping
# Date created:			  Tue Mar 25, 1997
# Whom:				  David O'Brien (obrien@NUXI.com)
#
# $FreeBSD: ports/net/fping/Makefile,v 1.23 2006/05/11 22:49:06 edwin Exp $
# $MidnightBSD: mports/net/fping/Makefile,v 1.2 2008/02/27 19:54:11 laffer1 Exp $
#

PORTNAME=	fping
PORTVERSION=	2.4b2
PORTREVISION=	1
CATEGORIES=	net ipv6
MASTER_SITES=	http://www.fping.com/download/ \
		http://keyserver.kjsl.com/~jharris/distfiles/
DISTNAME=	${PORTNAME}-${PORTVERSION}_to-ipv6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quickly ping N hosts w/o flooding the network
LICENSE=        bsd3
PLIST_FILES=	sbin/fping

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--bindir="${PREFIX}/sbin"
MAN8=		fping.8

.if defined(WITH_IPV6)
# IPv6 not enabled by default, as it does not work together with IPv4.
CFLAGS+=	-DIPV6
.endif

post-patch:
	@${REINPLACE_CMD} -e 's/fping@/${MAINTAINER:S/@/\\@/g} or fping@/g' \
		${WRKSRC}/fping.c

post-install:
	@${STRIP_CMD} ${PREFIX}/sbin/fping
	@${CHMOD} 4555 ${PREFIX}/sbin/fping

.include <bsd.port.mk>
