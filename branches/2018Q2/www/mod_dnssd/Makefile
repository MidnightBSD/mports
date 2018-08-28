# $MidnightBSD$

PORTNAME=	mod_dnssd
PORTVERSION=	0.6
PORTREVISION=	3
CATEGORIES=	www
MASTER_SITES=	http://0pointer.de/lennart/projects/mod_dnssd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache module that provides DNS-SD capabilities

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libavahi-client.so:net/avahi-app

USES=		gmake pkgconfig
USE_APACHE=	24
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	APR_CFLAGS="`${LOCALBASE}/bin/apr-1-config --cflags --cppflags --includes`" \
		APR_LIBS="`${LOCALBASE}/bin/apr-1-config --ldflags`"
CONFIGURE_ARGS=	--disable-lynx

OPTIONS_DEFINE=	DOCS

post-configure:
	${REINPLACE_CMD} -e 's|@APXS_STAGE@|-S LIBEXECDIR=${FAKE_DESTDIR}${TRUE_PREFIX}/${APACHEMODDIR}|' ${WRKSRC}/src/Makefile
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/${APACHEMODDIR}

#do-install:
#	${INSTALL_LIB} ${WRKSRC}/src/.libs/mod_dnssd.so ${FAKE_DESTDIR}${TRUE_PREFIX}/${APACHEMODDIR}
#	${INSTALL_LIB} ${WRKSRC}/src/.libs/mod_dnssd.a ${FAKE_DESTDIR}${TRUE_PREFIX}/${APACHEMODDIR}
#	${INSTALL_DATA} ${WRKSRC}/src/.libs/mod_dnssd.la ${FAKE_DESTDIR}${TRUE_PREFIX}/${APACHEMODDIR}

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/README ${DOCSDIR}/README
.endif

.include <bsd.port.mk>
