PORTNAME=	znc-push
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0.0-173
DISTVERSIONSUFFIX=	-g78d0385
PORTREVISION=	6
CATEGORIES=	irc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Push notification service module for ZNC
WWW=		https://github.com/jreese/znc-push

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	znc:irc/znc
LIB_DEPENDS=	libicudata.so:devel/icu
RUN_DEPENDS=	znc:irc/znc

USES=		compiler:c++11-lang gmake localbase:ldflags ssl

USE_GITHUB=	yes
GH_ACCOUNT=	jreese

MAKE_ENV=	version=${PORTVERSION}

# v2.0.0-{rc,dev} are ancient release candidates from 2014 for the seemingly
# abandoned Python branch.
PORTSCOUT=	skipv:v2.0.0-rc,v2.0.0-dev

PLIST_FILES=	lib/znc/push.so
PORTDOCS=	*.md

OPTIONS_DEFINE=	CURL DOCS

CURL_DESC=		Use curl for HTTP requests
CURL_LIB_DEPENDS=	libcurl.so:ftp/curl
CURL_MAKE_ENV=		curl=yes

do-install:
	${MKDIR} ${PREFIX}/lib/znc
	${INSTALL_PROGRAM} ${WRKSRC}/push.so ${PREFIX}/lib/znc/push.so
	@${STRIP_CMD} ${PREFIX}/lib/znc/push.so

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/README.md ${WRKSRC}/doc/*.md ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
