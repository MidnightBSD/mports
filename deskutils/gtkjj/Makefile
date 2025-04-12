PORTNAME=	gtkjj
PORTVERSION=	2.0.2
CATEGORIES=	deskutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	GTK client for posting JustJournal entries

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/../COPYING

WRKSRC_SUBDIR=	gtk

USES=		gnome pkgconfig
USE_GITHUB=     yes
GH_PROJECT=     justjournal-client-unix
GH_ACCOUNT=     JustJournal
GH_TAGNAME=     ${PORTVERSION}
USE_CSTD=       c99

CFLAGS+=        -I/usr/local/include
LDFLAGS+=       -L/usr/local/lib -lxmlrpc_client -lxmlrpc -lxmlrpc_xmlparse

LIB_DEPENDS=	libxmlrpc_client.so:net/xmlrpc-c
USE_GNOME=	gtk30

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

.include <bsd.mport.options.mk>

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${CP} ${WRKSRC}/../README ${FAKE_DESTDIR}${DOCSDIR}/README

.include <bsd.port.mk>
