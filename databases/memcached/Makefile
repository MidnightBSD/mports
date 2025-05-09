PORTNAME=	memcached
PORTVERSION=	1.6.36
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	http://www.memcached.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance distributed memory object cache system
WWW=		https://memcached.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	as:devel/binutils
LIB_DEPENDS=	libevent.so:devel/libevent

NO_TEST=	yes

CONFLICTS=	memcached-1.2*

USES=		autoreconf cpe pkgconfig shebangfix
SHEBANG_FILES=	scripts/memcached-tool

USE_RC_SUBR=	memcached
SUB_LIST+=	RC_SUBR_SUFFIX=${RC_SUBR_SUFFIX}

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libevent=${LOCALBASE} \
		--program-prefix= \
		--disable-coverage

# Dtrace option disabled until it is fixed upstream
OPTIONS_DEFINE=		SASL DOCS
OPTIONS_DEFAULT=	SASL

.if !exists(/usr/sbin/dtrace)
OPTIONS_EXCLUDE+=	DTRACE
.endif

OPTIONS_EXCLUDE_i386=		DTRACE
# ld(1) fails to link probes: Relocations in generic ELF (EM: 0)
OPTIONS_EXCLUDE_aarch64=	DTRACE
OPTIONS_EXCLUDE_armv6=		DTRACE
OPTIONS_EXCLUDE_armv7=		DTRACE

DTRACE_DESC=	Enable dtrace probes
SASL_DESC=	Enable SASL Authentication

DOCS_BUILD_DEPENDS=	xml2rfc:textproc/xml2rfc
DOCS_CONFIGURE_ENABLE=	docs

SASL_LIB_DEPENDS=	libsasl2.so:security/cyrus-sasl2
SASL_CONFIGURE_ENABLE=	sasl
SASL_CFLAGS=		-I${LOCALBASE}/include
SASL_CPPFLAGS+=		${CFLAGS}
SASL_LDFLAGS=		-L${LOCALBASE}/lib

MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=	--enable-tls
USES+=			ssl

.if ${ARCH} == amd64
CONFIGURE_ARGS+=	--enable-64bit
.endif

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/memcached-tool ${STAGEDIR}${PREFIX}/bin

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in protocol-binary-range.txt protocol-binary.txt protocol.txt \
		readme.txt threads.txt
	${INSTALL_DATA} ${WRKSRC}/doc/${i} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.post.mk>
