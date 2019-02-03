# $MidnightBSD$
# $FreeBSD: head/security/polarssl/Makefile 381519 2015-03-17 21:01:56Z pi $

PORTNAME=	polarssl
PORTVERSION=	1.2.13
DISTVERSIONSUFFIX=	-gpl
CATEGORIES=	security devel
MASTER_SITES=	https://polarssl.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Source embedded SSL/TLS cryptographic library

LICENSE=	gpl2

ALL_TARGET=	no_test

USES=		cpe gmake tar:tgz
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

DOCFILES=	ChangeLog README
BINFILES=	aescrypt2 benchmark dh_client dh_genprime dh_server hello \
		md5sum mpi_demo rsa_genkey rsa_sign rsa_verify selftest \
		sha1sum sha2sum ssl_cert_test ssl_client1 ssl_client2 \
		ssl_server ssl_test

# cmake install is broken, so we do it by hand
do-install:
	@cd ${WRKSRC}/include && ${COPYTREE_SHARE} ${PORTNAME} ${STAGEDIR}${PREFIX}/include "! -name *.orig"
	${INSTALL_DATA} ${WRKSRC}/library/libpolarssl.a ${STAGEDIR}${PREFIX}/lib/
	${INSTALL_DATA} ${WRKSRC}/library/libpolarssl.so ${STAGEDIR}${PREFIX}/lib/libpolarssl.so.5
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libpolarssl.so.5
	cd ${STAGEDIR}${PREFIX}/lib/ && ${LN} -sf libpolarssl.so.5 libpolarssl.so
.for i in ${BINFILES}
	${INSTALL_PROGRAM} ${WRKSRC}/programs/*/${i} ${STAGEDIR}${PREFIX}/bin/polarssl_${i}
.endfor

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
.for i in ${DOCFILES}
	${INSTALL_DATA} ${WRKSRC}/${i} ${STAGEDIR}${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
