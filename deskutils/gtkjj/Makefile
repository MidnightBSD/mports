PORTNAME=	gtkjj
PORTVERSION=	2.2.0
CATEGORIES=	deskutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	GTK client for posting JustJournal entries
WWW=		https://www.justjournal.com \
		https://github.com/JustJournal/justjournal-client-unix

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libjansson.so:devel/jansson

USES=		cmake gnome pkgconfig
USE_GITHUB=	yes
GH_PROJECT=	justjournal-client-unix
GH_ACCOUNT=	JustJournal
GH_TAGNAME=	${PORTVERSION}
USE_GNOME=	gtk30

CMAKE_ON=	BUILD_GTK
ALL_TARGET=	gtkjj

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/gtkjj ${PREFIX}/bin

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${CP} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}/README

.include <bsd.port.mk>
