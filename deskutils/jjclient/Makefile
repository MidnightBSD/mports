PORTNAME=	jjclient
PORTVERSION=	2.2.0
CATEGORIES=	deskutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Command line client for posting JustJournal entries
WWW=		https://www.justjournal.com \
		https://github.com/JustJournal/justjournal-client-unix

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libjansson.so:devel/jansson

USES=		cmake pkgconfig
USE_GITHUB=	yes
GH_PROJECT=	justjournal-client-unix
GH_ACCOUNT=	JustJournal
GH_TAGNAME=	${PORTVERSION}

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

.include <bsd.mport.options.mk>

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${CP} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}/README

.include <bsd.port.mk>
