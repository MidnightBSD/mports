# $MidnightBSD: mports/net/fping/Makefile,v 1.4 2013/03/06 01:19:24 laffer1 Exp $

PORTNAME=	fping
PORTVERSION=	3.5
CATEGORIES=	net ipv6
MASTER_SITES=	http://fping.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quickly ping N hosts w/o flooding the network
LICENSE=	other

OPTIONS_MULTI=		NET
OPTIONS_MULTI_NET=	IPV4 IPV6
OPTIONS_DEFAULT=	IPV4

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--bindir="${PREFIX}/sbin"

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MIPV4}
CONFIGURE_ARGS+=--enable-ipv4
PLIST_FILES+=sbin/fping
MAN8+=	fping.8
.else
CONFIGURE_ARGS+=--disable-ipv4
.endif

.if ${PORT_OPTIONS:MIPV6}
CONFIGURE_ARGS+=--enable-ipv6
PLIST_FILES+=sbin/fping6
MAN8+=	fping6.8
.else
CONFIGURE_ARGS+=--disable-ipv6
.endif

post-install:
.if ${PORT_OPTIONS:MIPV4}
	@${STRIP_CMD} ${PREFIX}/sbin/fping
	@${CHMOD} 4555 ${PREFIX}/sbin/fping
.endif
.if ${PORT_OPTIONS:MIPV6}
	@${STRIP_CMD} ${PREFIX}/sbin/fping6
	@${CHMOD} 4555 ${PREFIX}/sbin/fping6
.endif

.include <bsd.port.mk>
