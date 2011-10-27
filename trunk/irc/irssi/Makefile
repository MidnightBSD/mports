# New ports collection makefile for:	irssi
# Date created:			14 Apr 1999
# Whom:				Jim Mock <jim@FreeBSD.org>
#
# $MidnightBSD: mports/irc/irssi/Makefile,v 1.10 2010/04/25 23:22:13 laffer1 Exp $
# $FreeBSD: ports/irc/irssi/Makefile,v 1.91 2006/09/10 15:11:53 vanilla Exp $
#

PORTNAME=	irssi
PORTVERSION=	0.8.15
PORTREVISION=	0
CATEGORIES?=	irc
MASTER_SITES=	http://mirror.irssi.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A modular IRC client with many features
LICENSE=	gpl2

USE_BZIP2=	yes
USE_SSP=	yes
USE_GNOME=	glib20
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-module
WANT_PERL=	yes

MAN1=		irssi.1

OPTIONS=	PERL "Enable perl support" on \
		PROXY "Enable proxy support" off \
		SOCKS "Enable socks proxy support" off \
		IPV6 "Enable IPv6" on \
		BOT "Enable bot" off
# USE_OPENSSL must be defined before bsd.port.pre.mk so use old schema
# for WITH_SSL option

.if defined(WITHOUT_SSL)
CONFIGURE_ARGS+=	--disable-ssl
.else
USE_OPENSSL=	yes
.endif

.include <bsd.port.pre.mk>

# Process options.

.if !defined(WITHOUT_PERL)
USE_PERL5=	yes
CONFIGURE_ARGS+=	--with-perl-lib=site
PLIST_SUB+=	WITH_PERL=""
.else
CONFIGURE_ARGS+=	--without-perl
PLIST_SUB+=	WITH_PERL="@comment "
.endif

.if defined(WITH_PROXY)
CONFIGURE_ARGS+=	--with-proxy
PLIST_SUB+=	WITH_PROXY=""
.else
PLIST_SUB+=	WITH_PROXY="@comment "
.endif

.if defined(WITH_SOCKS)
CONFIGURE_ARGS+=	--with-socks
.endif

.if !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
CATEGORIES+=	ipv6
.endif

.if defined(WITH_BOT)
CONFIGURE_ARGS+=	--with-bot
PLIST_SUB+=	WITH_BOT=""
.else
CONFIGURE_ARGS+=	--without-bot
PLIST_SUB+=	WITH_BOT="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr|${PREFIX}|' -e 's|/etc|${PREFIX}&|' \
		${WRKSRC}/docs/irssi.1

post-configure:
	@${MV} ${WRKSRC}/irssi.conf ${WRKSRC}/irssi.conf.sample


.include <bsd.port.post.mk>
