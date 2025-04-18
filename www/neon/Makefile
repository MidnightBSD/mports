PORTNAME=	neon
DISTVERSION=	0.32.5
CATEGORIES=	www
MASTER_SITES=	https://notroj.github.io/neon/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP and WebDAV client library for Unix systems
WWW=		https://notroj.github.io/neon/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/src/COPYING.LIB

USES=		cpe libtool localbase:ldflags pathfix pkgconfig
CPE_VENDOR=	webdav
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared --disable-static

OPTIONS_DEFINE=		CA_BUNDLE DOCS GSSAPI NLS PROXY
OPTIONS_DEFAULT=	CA_BUNDLE EXPAT GSSAPI OPENSSL

OPTIONS_RADIO=		SSL
OPTIONS_RADIO_SSL=	GNUTLS OPENSSL
OPTIONS_SINGLE=		XML
OPTIONS_SINGLE_XML=	EXPAT LIBXML2

CA_BUNDLE_DESC=		Enable CA bundle for GnuTLS/OpenSSL
DOCS_DESC=		Build and/or install documentation (including manpages)
LIBXML2_DESC=		libxml2 XML parser support
PROXY_DESC=		libproxy support
XML_DESC=		XML parser library

CA_BUNDLE_CONFIGURE_ON=	--with-ca-bundle=${LOCALBASE}/share/certs/ca-root-nss.crt
CA_BUNDLE_RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss

DOCS_BUILD_DEPENDS=	xmlto:textproc/xmlto \
			docbook-xml>0:textproc/docbook-xml

DOCS_EXTRA_PATCHES_OFF=	${FILESDIR}/extrapatch-docs

EXPAT_LIB_DEPENDS=	libexpat.so:textproc/expat2
EXPAT_CONFIGURE_WITH=	expat

GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls
GNUTLS_CONFIGURE_ON=	--with-ssl=gnutls

GSSAPI_CONFIGURE_WITH=	gssapi

LIBXML2_CONFIGURE_WITH=	libxml2
LIBXML2_USES=		gnome
LIBXML2_USE=		GNOME=libxml2

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext

OPENSSL_USES=		ssl
OPENSSL_CONFIGURE_ENV=	ne_cv_libsfor_SSL_library_init=-lssl
OPENSSL_CONFIGURE_ON=	--with-ssl=openssl

PROXY_CONFIGURE_WITH=	libproxy
PROXY_LIB_DEPENDS=	libproxy.so:net/libproxy

OPTIONS_SUB=		yes
DOCSDIR=		${PREFIX}/share/doc/neon

post-patch:
	${REINPLACE_CMD} -e 's|-@NEON_VERSION@$$||' ${WRKSRC}/Makefile.in

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libneon.so.27.*

.include <bsd.port.mk>
