PORTNAME=	wget
DISTVERSION=	1.25.0
CATEGORIES=	ftp www
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Retrieve files from the Net via HTTP(S) and FTP
WWW=		https://www.gnu.org/s/wget/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

# not magus friendly
NO_TEST=	yes

USES=		charsetfix cpe iconv localbase pkgconfig tar:lz
USE_CSTD=	c99
CPE_VENDOR=	gnu
GNU_CONFIGURE=	yes
OPTIONS_SUB=	yes

OPTIONS_RADIO=	SSL
OPTIONS_RADIO_SSL=GNUTLS OPENSSL
OPTIONS_DEFINE=	DOCS IDN IPV6 MANPAGES METALINK NLS PCRE2 PSL NTLM
OPTIONS_DEFAULT=IDN MANPAGES OPENSSL NLS

DOCS_DESC=	Install info page
DOCS_CONFIGURE_ENV=	MAKEINFO="${MAKEINFO}"
DOCS_INFO=	wget
DOCS_USES=	makeinfo

IDN_LIB_DEPENDS=	libidn2.so:dns/libidn2 \
			libunistring.so:devel/libunistring
IDN_CONFIGURE_ENABLE=	iri
IDN_CONFIGURE_ON=	--with-libidn=${LOCALBASE} \
			--with-libunistring-prefix=${LOCALBASE}
IDN_CONFIGURE_OFF=	--with-included-libunistring

IPV6_CONFIGURE_ENABLE=	ipv6

MANPAGES_CONFIGURE_ENV_OFF=	ac_cv_path_POD2MAN=no
MANPAGES_USE=		PERL5=build
MANPAGES_USES=		perl5

METALINK_CONFIGURE_WITH=metalink
METALINK_LIB_DEPENDS=	libmetalink.so:misc/libmetalink

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls

PCRE2_DESC=		Support PCRE2 style regular expressions
PCRE2_LIB_DEPENDS=	libpcre2-8.so:devel/pcre2
PCRE2_CONFIGURE_ENABLE=	pcre2

PSL_CONFIGURE_WITH=	libpsl
PSL_LIB_DEPENDS=	libpsl.so:dns/libpsl

NTLM_DESC=		Support NTLM authorization
NTLM_CONFIGURE_ENABLE=	ntlm

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MOPENSSL}
EXTENSIONS+=	ssl
CONFIGURE_ARGS+=--with-ssl=openssl --with-libssl-prefix=${OPENSSLBASE}
CPPFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
.elif ${PORT_OPTIONS:MGNUTLS}
LIB_DEPENDS+=	libgnutls.so:security/gnutls
CONFIGURE_ARGS+=--with-ssl=gnutls
. if ${PORT_OPTIONS:MNTLM}
LIB_DEPENDS+=	libnettle.so:security/nettle
. endif
.else
CONFIGURE_ARGS+=--without-ssl
.endif

# Executed regardless of whether DOCS is ON or OFF.
post-patch:
	${REINPLACE_CMD} -e 's,WGETRC = $$(sysconfdir)/wgetrc,&.sample,' \
		${WRKSRC}/doc/Makefile.in
	${REINPLACE_CMD} -e 's,/usr/local/etc/wgetrc,${PREFIX}/etc/wgetrc,' \
		${WRKSRC}/doc/sample.wgetrc* \
		${WRKSRC}/doc/wget.texi

post-patch-DOCS-off:
	${REINPLACE_CMD} \
		-e '/^all: wget.info/ s,wget.info,,' \
		-e '/^all-am:/ s, $$(INFO_DEPS),,' \
		-e '/^install-data-am:/ s, install-info-am,,' \
		${WRKSRC}/doc/Makefile.in

.include <bsd.port.mk>
