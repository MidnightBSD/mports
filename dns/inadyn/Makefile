# Created by: Alex Samorukov <samm@freebsd.org>

PORTNAME=	inadyn
PORTVERSION=	2.9.0
CATEGORIES=	dns
MASTER_SITES=	https://github.com/troglobit/${PORTNAME}/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamic DNS update client

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libconfuse.so:devel/libconfuse
RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss

USES=		pkgconfig tar:xz

GNU_CONFIGURE=	yes

USERS=		inadyn
GROUPS=		inadyn

USE_RC_SUBR=	inadyn

OPTIONS_DEFINE=		DOCS EXAMPLES
OPTIONS_DEFAULT=	OPENSSL
OPTIONS_SINGLE=		TLS
OPTIONS_SINGLE_TLS=	GNUTLS OPENSSL

GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls
OPENSSL_USES=		ssl
OPENSSL_CONFIGURE_ENABLE=	openssl
OPENSSL_CONFIGURE_ON=	OpenSSL_CFLAGS=-I${OPENSSLINC} OpenSSL_LIBS="-L${OPENSSLLIB} -lssl"

post-patch:
	@${REINPLACE_CMD} -e "s,%%PREFIX%%,${PREFIX},g" \
		${WRKSRC}/man/inadyn.8 ${WRKSRC}/man/inadyn.conf.5 \
		${WRKSRC}/examples/README.md ${WRKSRC}/examples/inadyn.conf

post-install:
	${MV} ${STAGEDIR}${DOCSDIR}/examples ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${STAGEDIR}${EXAMPLESDIR}/inadyn.conf ${STAGEDIR}${PREFIX}/etc/inadyn.conf.sample
	${MKDIR} ${FAKE_DESTDIR}/var/cache/inadyn
	${MKDIR} ${FAKE_DESTDIR}/var/run/inadyn

.include <bsd.port.mk>
