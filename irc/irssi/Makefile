# $MidnightBSD: mports/irc/irssi/Makefile,v 1.14 2013/07/13 13:38:57 laffer1 Exp $

PORTNAME=	irssi
PORTVERSION=	0.8.15
PORTREVISION=	4
CATEGORIES?=	irc
MASTER_SITES=	http://mirror.irssi.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A modular IRC client with many features

LICENSE=	gpl2

LIB_DEPENDS=	glib-2:${PORTSDIR}/devel/glib20

USES=		pkgconfig ncurses
USE_BZIP2=	yes
USE_SSP=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
WANT_PERL=	yes

MAN1=		irssi.1

OPTIONS_DEFINE=	PERL PROXY SOCKS IPV6 BOT
SOCKS_DESC=	Socks proxy support
BOT_DESC=	Bot support
OPTIONS_DEFAULT=	PERL IPV6

# USE_OPENSSL must be defined before bsd.port.pre.mk so use old schema
# for WITH_SSL option

.if defined(WITHOUT_SSL)
CONFIGURE_ARGS+=	--disable-ssl
.else
USE_OPENSSL=	yes
.endif

.include <bsd.mport.options.mk>

# Process options.

.if ${PORT_OPTIONS:MPERL}
USE_PERL5=	yes
CONFIGURE_ARGS+=	--with-perl-lib=site
PLIST_SUB+=	WITH_PERL=""
.else
CONFIGURE_ARGS+=	--without-perl
PLIST_SUB+=	WITH_PERL="@comment "
.endif

.if ${PORT_OPTIONS:MPROXY}
CONFIGURE_ARGS+=	--with-proxy
PLIST_SUB+=	WITH_PROXY=""
.else
PLIST_SUB+=	WITH_PROXY="@comment "
.endif

.if ${PORT_OPTIONS:MSOCKS}
CONFIGURE_ARGS+=	--with-socks
.endif

.if !${PORT_OPTIONS:MIPV6}
CONFIGURE_ARGS+=	--disable-ipv6
CATEGORIES+=	ipv6
.endif

.if ${PORT_OPTIONS:MBOT}
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


.include <bsd.port.mk>
