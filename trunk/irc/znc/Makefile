# New ports collection makefile for:   znc
# Date created:        May 9 2008
# Whom:                Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/irc/znc/Makefile,v 1.3 2009/12/25 16:33:09 laffer1 Exp $
#

PORTNAME=	znc
PORTVERSION=	0.076
CATEGORIES=	irc ipv6
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An advanced IRC bouncer
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack
WANT_PERL=	yes
CONFIGURE_ARGS=	--disable-c-ares

OPTIONS=	DEBUG		"Enable debugging" off \
		IPV6		"Enable IPv6 support" off \
		OPENSSL		"Enable OpenSSL support" on \
		PERL		"Enable Perl support" on \
		SASL		"Enable SASL support" off

.include <bsd.mport.options.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITH_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
.endif

.if defined(WITH_OPENSSL)
EXTENSIONS+=		openssl
CONFIGURE_ARGS+=	--with-openssl=${OPENSSLBASE}
PLIST_SUB+=		OPENSSL=""
.else
CONFIGURE_ARGS+=	--disable-openssl
PLIST_SUB+=		OPENSSL="@comment "
.endif

.if defined(WITH_PERL)
USE_PERL5=		yes
PLIST_SUB+=		PERL=""
.else
CONFIGURE_ARGS+=	--disable-perl
PLIST_SUB+=		PERL="@comment "
.endif

.if defined(WITH_SASL)
LIB_DEPENDS+=		sasl2.2:${PORTSDIR}/security/cyrus-sasl2
CONFIGURE_ARGS+=	--enable-sasl
CONFIGURE_ENV+=		LDFLAGS="-L${LOCALBASE}/lib"
PLIST_SUB+=		SASL=""
.else
PLIST_SUB+=		SASL="@comment "
.endif

MANCOMPREEED= yes
MAN1=         znc.1.gz znc-buildmod.1.gz znc-config.1.gz

.include <bsd.port.pre.mk>

.include <bsd.port.post.mk>
