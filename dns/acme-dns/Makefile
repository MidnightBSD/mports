PORTNAME=		acme-dns
DISTVERSIONPREFIX=	v
DISTVERSION=		2.0.2
PORTEPOCH=		1
CATEGORIES=		dns

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Limited DNS server with RESTful HTTP API to handle ACME DNS challenges
WWW=		https://github.com/acme-dns/acme-dns

LICENSE=		mit
LICENSE_FILE=		${WRKSRC}/LICENSE

USES=			go:modules

USE_GITHUB=		yes
GH_ACCOUNT=		acme-dns

GO_MODULE=		github.com/joohoi/acme-dns
GO_MOD_DIST=		github

NO_TEST=	yes

USE_RC_SUBR=		acme_dns

post-patch:
	@${REINPLACE_CMD} -e 's|"/etc/acme-dns|"${PREFIX}/etc/acme-dns|' ${WRKSRC}/main.go
	@${REINPLACE_CMD} -e 's|"/etc/tls|"${PREFIX}/etc/tls|' \
		-e 's|^connection = "acme-dns.db"|connection = "/var/db/acme-dns/acme-dns.db"|' \
		-e 's|^acme_cache_dir = "api-certs"|acme_cache_dir = "/var/db/acme-dns/api-certs"|' \
		-e 's|^logfile = "./acme-dns.log"|logfile = "/var/log/acme-dns.log"|' \
		${WRKSRC}/config.cfg

post-install:
	${MKDIR} ${FAKE_DESTDIR}/var/db/acme-dns
	${MKDIR} ${FAKE_DESTDIR}/var/run/acme-dns
	${MKDIR} ${PREFIX}/etc/acme-dns
	${CP} ${WRKSRC}/config.cfg ${PREFIX}/etc/acme-dns/config.cfg.sample
	${MV} ${PREFIX}/bin/acme-dns ${PREFIX}/libexec/acme-dns

.include <bsd.port.mk>
