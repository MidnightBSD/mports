# $MidnightBSD$

PORTNAME=	jjclient
PORTVERSION=	1.0.3
CATEGORIES=	deskutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Command line client for posting JustJournal entries

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

WRKSRC=         ${WRKDIR}/justjournal-client-unix-${PORTVERSION}
USE_GITHUB=     yes
GH_PROJECT=     justjournal-client-unix
GH_ACCOUNT=     laffer1
GH_TAGNAME=     ${PORTVERSION}
GH_COMMIT=      0a8de9b
USE_CSTD=	c99

CFLAGS+=	-I/usr/local/include
LDFLAGS+=	-L/usr/local/lib -lxmlrpc_client -lxmlrpc -lxmlrpc_xmlparse

LIB_DEPENDS=	libxmlrpc.so:${PORTSDIR}/net/xmlrpc-c

PORTDOCS=	*

post-install:
		${CP} ${WRKSRC}/README ${DOCSDIR}

.include <bsd.port.mk>
