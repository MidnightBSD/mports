# $MidnightBSD$

PORTNAME=	irssi
PORTVERSION=	0.8.17
PORTREVISION=	0
CATEGORIES?=	irc
MASTER_SITES=	http://mirror.irssi.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modular IRC client with many features

LICENSE=	gpl2

LIB_DEPENDS=	libglib-2.0.so:${PORTSDIR}/devel/glib20

USES=		gmake pkgconfig ncurses tar:bzip2 libtool perl5
USE_SSP=	yes
GNU_CONFIGURE=	yes

PLIST_SUB+=	SITE_ARCH=${SITE_ARCH_REL}

CONFIGURE_ARGS=	--with-ncurses=${NCURSESBASE} --with-perl-lib=site
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	PROXY SOCKS IPV6 BOT DOCS TRUECOLOR
OPTIONS_DEFAULT=	IPV6 DOCS
OPTIONS_SUB=	yes
SOCKS_DESC=	Socks proxy support
SOCKS_CONFIGURE_WITH=	socks
BOT_DESC=	Bot support
BOT_CONFIGURE_WITH=	bot
PROXY_CONFIGURE_WITH=	proxy
IPV6_CONFIGURE_ENABLE=	ipv6
IPV6_CATEGORIES=	ipv6
TRUECOLOR_DESC=	Truecolor (24bit) support
TRUECOLOR_CONFIGURE_ENABLE=	true-color

# USE_OPENSSL must be defined before bsd.port.pre.mk so use old schema
# for WITH_SSL option

.if defined(WITHOUT_SSL)
CONFIGURE_ARGS+=	--disable-ssl
.else
USE_OPENSSL=	yes
.endif

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/usr|${PREFIX}|' -e 's|/etc|${PREFIX}&|' \
		${WRKSRC}/docs/irssi.1

post-configure:
	@${MV} ${WRKSRC}/irssi.conf ${WRKSRC}/irssi.conf.sample

post-install:
	@${MKDIR} ${PREFIX}/lib/irssi/modules

.include <bsd.port.mk>
