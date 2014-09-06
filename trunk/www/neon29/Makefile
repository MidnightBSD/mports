# $MidnightBSD$

PORTNAME=	neon29
PORTVERSION=	0.29.6
PORTREVISION=	6
CATEGORIES=	www
MASTER_SITES=	http://www.webdav.org/neon/
DISTNAME=	neon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP and WebDAV client library for Unix systems

LICENSE=	lgpl

CONFLICTS=	neon2[6|8]-[0-9]*

OPTIONS_DEFINE=	OPENSSL NLS GSSAPI PROXY DOCS
OPTIONS_DEFAULT=	EXPAT OPENSSL NLS GSSAPI
OPTIONS_SINGLE=	XML
OPTIONS_SINGLE_XML=	EXPAT LIBXML

CA_BUNDLE_DESC=		Install CA bundle for OpenSS
XML_DESC=	XML parser library
LIBXML_DESC=	libxml2 XML parser support
PROXY_DESC=	libproxy support

USE_LDCONFIG=	yes

USES=		pathfix libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared \
		--with-libs=${LOCALBASE}:${PREFIX}

CA_BUNDLE_CONFIGURE_ON=	--with-ca-bundle=${LOCALBASE}/share/certs/ca-root-nss.crt
CA_BUNDLE_RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MCA_BUNDLE} && !${PORT_OPTIONS:MOPENSSL}
WARNING+=	"OpenSSL need for CA bundle support"
WARNING+=	"Enable the OPENSSL option or disable the CA_BUNDLE option"
.endif

.if ${PORT_OPTIONS:MEXPAT}
CONFIGURE_ARGS+=--with-expat
LIB_DEPENDS+=	libexpat.so:${PORTSDIR}/textproc/expat2
.endif

.if ${PORT_OPTIONS:MLIBXML}
CONFIGURE_ARGS+=--with-libxml2
LIB_DEPENDS+=	xml2:${PORTSDIR}/textproc/libxml2
.endif

.if ${PORT_OPTIONS:MOPENSSL}
CONFIGURE_ARGS+=--with-ssl
USE_OPENSSL=	yes
.endif

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if ! ${PORT_OPTIONS:MGSSAPI}
CONFIGURE_ARGS+=--without-gssapi
.endif

.if ${PORT_OPTIONS:MPROXY}
CONFIGURE_ARGS+=--with-libproxy
LIB_DEPENDS+=	proxy:${PORTSDIR}/net/libproxy
.else
CONFIGURE_ARGS+=--without-libproxy
.endif

PLIST_SUB+=	PORTVERSION=${PORTVERSION}
DOCSDIR=	${PREFIX}/share/doc/neon

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/man/*.1 ${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/doc/man/*.3 ${MANPREFIX}/man/man3
	${STRIP_CMD} ${PREFIX}/lib/libneon.so.29
.if ${PORT_OPTIONS:MDOCS}
	(cd ${WRKSRC} ; ${MAKE} ${FAKE_MAKEARGS} install-html)
.endif

.include <bsd.port.mk>
