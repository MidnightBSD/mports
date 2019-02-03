# $MidnightBSD$

PORTNAME=	memcached
PORTVERSION=	1.5.5
CATEGORIES=	databases
MASTER_SITES=	http://www.memcached.org/files/ \
		GENTOO

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance distributed memory object cache system

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libevent.so:devel/libevent

CONFLICTS=	memcached-1.2*

# Dtrace option disabled until it is fixed upstream
OPTIONS_DEFINE=		SASL DOCS DTRACE
OPTIONS_DEFAULT=	SASL

DTRACE_DESC=	Enable dtrace probes
SASL_DESC=	Enable SASL Authentication

USE_RC_SUBR=	memcached
SUB_LIST+=	RC_SUBR_SUFFIX=${RC_SUBR_SUFFIX}

USES=		cpe shebangfix autoreconf:build
USE_AUTOTOOLS=	aclocal
SHEBANG_FILES=	scripts/memcached-tool

USE_CSTD=	c99
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libevent=${LOCALBASE} \
		--program-prefix= \
		--disable-coverage

DOCS_BUILD_DEPENDS=	xml2rfc:textproc/xml2rfc
DOCS_CONFIGURE_ENABLE=	docs

DTRACE_CONFIGURE_ENABLE=	dtrace

SASL_LIB_DEPENDS=	libsasl2.so:security/cyrus-sasl2
SASL_CONFIGURE_ENABLE=	sasl
SASL_CFLAGS=		-I${LOCALBASE}/include
SASL_CPPFLAGS+=		${CFLAGS}
SASL_LDFLAGS=		-L${LOCALBASE}/lib

MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
CONFIGURE_ARGS+=	--enable-64bit
.endif

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/memcached-tool ${STAGEDIR}${PREFIX}/bin
	${MKDIR} ${DOCSDIR}
.for i in protocol-binary-range.txt protocol-binary.txt protocol.txt \
		readme.txt threads.txt
	${INSTALL_DATA} ${WRKSRC}/doc/${i} ${DOCSDIR}
.endfor

regression-test: test
test: build
	${MAKE} -C ${WRKSRC} test

.include <bsd.port.post.mk>
