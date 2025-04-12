PORTNAME=	jjclient
PORTVERSION=	2.0.2
CATEGORIES=	deskutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Command line client for posting JustJournal entries

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

USE_GITHUB=     yes
GH_PROJECT=     justjournal-client-unix
GH_ACCOUNT=     JustJournal
GH_TAGNAME=     ${PORTVERSION}
USE_CSTD=	c99

CFLAGS+=	-I/usr/local/include
LDFLAGS+=	-L/usr/local/lib -lxmlrpc_client -lxmlrpc -lxmlrpc_xmlparse -lxmlrpc_util

LIB_DEPENDS=	libxmlrpc.so:net/xmlrpc-c

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=    yes

.include <bsd.mport.options.mk>

post-install-DOCS-on:
		${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
		${CP} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}/README

.include <bsd.port.mk>
