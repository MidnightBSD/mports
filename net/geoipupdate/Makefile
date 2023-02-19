PORTNAME=	geoipupdate
PORTVERSION=	4.10.0
DISTVERSIONPREFIX=	v
CATEGORIES=	net geography

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fetch the latest copies of the GeoIP2 databases
WWW=		https://github.com/maxmind/geoipupdate

LICENSE=	apache2 mit
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

RUN_DEPENDS=	ca_root_nss>=3:security/ca_root_nss

USES=		gmake go:modules,no_targets
GO_MODULE=	github.com/maxmind/geoipupdate/v4

MAKE_ENV+=	${GO_ENV} \
		CONFFILE=${PREFIX}/etc/GeoIP.conf \
		DATADIR=${PREFIX}/share/GeoIP \
		VERSION=${DISTVERSIONFULL}

OPTIONS_DEFINE=	DOCS MANPAGES
OPTIONS_DEFAULT=MANPAGES

MANPAGES_BUILD_DEPENDS=	lowdown:textproc/lowdown
MANPAGES_PLIST_FILES=	man/man1/geoipupdate.1.gz \
			man/man5/GeoIP.conf.5.gz

PLIST_FILES=	bin/geoipupdate \
		'@sample etc/GeoIP.conf.sample' \
		'@dir share/GeoIP'
PORTDOCS=	GeoIP.conf.md geoipupdate.md
SUB_FILES=	pkg-message

do-build-MANPAGES-on:
	# lowdown generates everything as section 7
	{ ${PRINTF} "title: geoipupdate\n\n" && ${CAT} ${WRKSRC}/doc/geoipupdate.md; } \
		| ${LOCALBASE}/bin/lowdown -s -Tman \
		| ${SED} -e '1s/7/1/' > ${WRKSRC}/build/geoipupdate.1
	{ ${PRINTF} "title: GeoIP.conf\n\n" && ${CAT} ${WRKSRC}/doc/GeoIP.conf.md; } \
		| ${LOCALBASE}/bin/lowdown -s -Tman \
		| ${SED} -e '1s/7/5/' > ${WRKSRC}/build/GeoIP.conf.5

do-install:
	${MKDIR} ${PREFIX}/share/GeoIP
	${INSTALL_PROGRAM} ${WRKSRC}/build/geoipupdate ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/build/GeoIP.conf ${PREFIX}/etc/GeoIP.conf.sample

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/build && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

do-install-MANPAGES-on:
	${INSTALL_MAN} ${WRKSRC}/build/geoipupdate.1 ${FAKE_DESTDIR}${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/build/GeoIP.conf.5  ${FAKE_DESTDIR}${MANPREFIX}/man/man5

.include <bsd.port.mk>
