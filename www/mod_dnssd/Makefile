PORTNAME=	mod_dnssd
PORTVERSION=	0.6
PORTREVISION=	4
CATEGORIES=	www
MASTER_SITES=	http://0pointer.de/lennart/projects/mod_dnssd/
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache module that provides DNS-SD capabilities
WWW=		https://0pointer.de/lennart/projects/mod_dnssd/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libavahi-client.so:net/avahi-app

USES=		apache:2.4+ gmake pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	APR_CFLAGS="`${LOCALBASE}/bin/apr-1-config --cflags --cppflags --includes`" \
		APR_LIBS="`${LOCALBASE}/bin/apr-1-config --ldflags`"
CONFIGURE_ARGS=	--disable-lynx

OPTIONS_DEFINE=	DOCS

post-configure:
	${REINPLACE_CMD} -e 's|@APXS_STAGE@|-S LIBEXECDIR=${FAKE_DESTDIR}${TRUE_PREFIX}/${APACHEMODDIR}|' ${WRKSRC}/src/Makefile
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/${APACHEMODDIR}

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/${APACHEMODDIR}/${MODULENAME}.so

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/README ${FAKE_DESTDIR}${DOCSDIR}/README

.include <bsd.port.mk>
