PORTNAME=	mod_fcgid
PORTVERSION=	2.3.9
CATEGORIES=	www
MASTER_SITES=		APACHE_HTTPD/${PORTNAME}
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}
DIST_SUBDIR=	apache2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alternative FastCGI module for Apache2
WWW=		https://httpd.apache.org/mod_fcgid/

LICENSE=	Apache-2.0

USES=		apache cpe
CPE_VENDOR=	apache

HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	configure.apxs

INSTALL_WRKSRC=	${WRKSRC}/modules/fcgid

SUB_FILES=	pkg-message
SUB_LIST+=	APACHEMODDIR=${APACHEMODDIR}
PLIST_SUB+=	APACHEMODDIR=${APACHEMODDIR}

MAKE_ARGS+=	top_dir="${LOCALBASE}/share/apache${APACHE_VERSION}"
MAKE_ARGS+=	INCLUDES="-I${LOCALBASE}/include/apache${APACHE_VERSION} -I${LOCALBASE}/include/apr-1"
INSTALL_TARGET=	install-modules-yes
DOCSDIR=	${PREFIX}/share/doc/apache${APACHE_VERSION}/mod

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${FAKE_DESTDIR}/var/run/fcgidsock

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/manual/mod/mod_fcgid.html ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/manual/mod/mod_fcgid.html.en ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
