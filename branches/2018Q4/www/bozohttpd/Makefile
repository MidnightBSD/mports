# $MidnightBSD$

PORTNAME=	bozohttpd
PORTVERSION=	20130711
CATEGORIES=	www ipv6
MASTER_SITES=	http://www.eterna.com.au/bozohttpd/ \
		${MASTER_SITE_NETBSD}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The bozotic HTTP server

LICENSE=	bsd3

FAKE_OPTS=	trueprefix
USE_RC_SUBR=	bozohttpd

#options handling
OPTIONS=	HTPASSWD_SUPPORT	"Enable htpassord support" 	off \
		SSL			"Enable SSL support"		on \
		CGI			"Enable CGI support"		on

USES=		uidfix tar:bzip2

HTPASSWD_DESC=		Enable htpassword support
SSL_DESC=		Enable SSL support
CGI_DESC=		Enable CGI support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MHTPASSWD}
MAKE_ARGS+=	'COPTS+=	-DDO_HTPASSWD' \
		'LDFLAGS+= -lcrypt'
.else
MAKE_ARGS+=	'COPTS+=	-UDO_HTPASSWD'
.endif

.if ${PORT_OPTIONS:MSSL}
EXTENSIONS+=    ssl
MAKE_ARGS+=	'COPTS+=	-UNO_SSL_SUPPORT'
.else
MAKE_ARGS+=	'COPTS+=	-DNO_SSL_SUPPORT' \
		'CRYPTOLIBS=' \
		'CRYPTODEPS='
.endif

.if ${PORT_OPTIONS:MCGI}
MAKE_ARGS+=	'COPTS+=	-UNO_CGIBIN_SUPPORT'
.else
MAKE_ARGS+=	'COPTS+=	-DNO_CGIBIN_SUPPORT'
.endif

PLIST_FILES=	libexec/bozohttpd \
		man/man8/bozohttpd.8.gz
post-patch:
	@${REINPLACE_CMD} -e 's|@@PREFIX@@|${PREFIX}|g' ${WRKSRC}/bozohttpd.8

.include <bsd.port.mk>
