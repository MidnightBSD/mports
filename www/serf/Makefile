PORTNAME=	serf
PORTVERSION=	1.3.10
CATEGORIES=	www
MASTER_SITES=	APACHE/serf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serf HTTP client library
WWW=		https://serf.apache.org/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS+=	libapr-1.so:devel/apr1

USES=		scons ssl tar:bzip2 cpe
USE_LDCONFIG=	yes

CPE_VENDOR=	serf_project

OPTIONS_DEFINE=		DOCS
OPTIONS_RADIO=		KERBEROS
OPTIONS_RADIO_KERBEROS=	GSSAPI_BASE GSSAPI_HEIMDAL GSSAPI_MIT

GSSAPI_BASE_DESC=		Heimdal Kerberos (base)
GSSAPI_HEIMDAL_DESC=		Heimdal Kerberos (security/heimdal)
GSSAPI_MIT_DESC=		MIT Kerberos (security/krb5)
GSSAPI_HEIMDAL_LIB_DEPENDS=	libkrb5.so.26:security/heimdal
GSSAPI_MIT_LIB_DEPENDS=		libkrb5.so.3:security/krb5

SCONS_ARGS=	APR=${LOCALBASE}/bin/apr-1-config
SCONS_ARGS+=	APU=${LOCALBASE}/bin/apu-1-config
SCONS_ARGS+=	OPENSSL=${OPENSSLBASE}
SCONS_ARGS+=	PREFIX=${PREFIX}
SCONS_ARGS+=	CC=${CC}
SCONS_ARGS+=	CFLAGS="${CFLAGS}"
INSTALL_TARGET=	install --install-sandbox=${STAGEDIR}
#TEST_TARGET=	check  # some tests fail
NO_TEST=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGSSAPI_BASE}
SCONS_ARGS+=	GSSAPI="/usr"
.endif
.if ${PORT_OPTIONS:MGSSAPI_MIT} || ${PORT_OPTIONS:MGSSAPI_HEIMDAL}
SCONS_ARGS+=	GSSAPI="${LOCALBASE}"
.endif

post-patch:
	@${REINPLACE_CMD} -E \
		-e '/^Requires.private/s/(libssl|libcrypto)//g' \
		-e '/^Libs.private/s|$$| -L${OPENSSLLIB} -lssl -lcrypto|' \
		${WRKSRC}/build/serf.pc.in

do-build:
	@(cd ${WRKSRC} && ${SETENV} ${MAKE_CMD} ${SCONS_ARGS})

do-install:
	@(cd ${WRKSRC} && ${SENTENV} ${MAKE_CMD} ${SCONS_ARGS} ${INSTALL_TARGET})


post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/design-guide.txt ${FAKE_DESTDIR}${DOCSDIR}
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/lib/libserf-1.so

.include <bsd.port.pre.mk>

MAKE_ARGS=	${SCONS_ARGS}

.include <bsd.port.post.mk>
