PORTNAME=	tintin++
PORTVERSION=	2.02.42
CATEGORIES+=	net games
MASTER_SITES=	SF/tintin/TinTin%2B%2B%20Source%20Code/${PORTVERSION:C|.$||}/ \
		https://github.com/scandum/tintin/releases/download/${PORTVERSION}/
DISTNAME=	tintin-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client program to help playing MUDs
WWW=		https://tintin.mudhalla.net/ \
		https://github.com/scandum/tintin

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/../COPYING

LIB_DEPENDS=	libpcre.so:devel/pcre

USES=		gmake localbase

CONFIGURE_ARGS=	--includedir=${LOCALBASE}/include \
		--libdir=${LOCALBASE}/lib \
		--prefix=${PREFIX}
CONFIGURE_ENV=	ac_cv_file__dev_ptmx=no
GNU_CONFIGURE=	yes
WRKSRC=		${WRKDIR}/tt/src

PLIST_FILES=	bin/tt++
PORTDOCS=	CREDITS FAQ README SCRIPTS TODO

CONFLICTS_INSTALL?=	zh-tintin++

SLAVEDIRS=	chinese/tintin++

OPTIONS_DEFINE=	BIG5 DOCS GNUTLS
BIG5_DESC=	Big5 support

BIG5_CONFIGURE_ENABLE=	big5
GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls
GNUTLS_CONFIGURE_ENV_OFF=	ac_cv_header_gnutls_gnutls_h=no \
				ac_cv_lib_gnutls_gnutls_init=no

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tt++ ${STAGEDIR}${PREFIX}/bin/

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/../ && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
