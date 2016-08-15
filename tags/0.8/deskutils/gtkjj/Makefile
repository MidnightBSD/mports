# $MidnightBSD$

PORTNAME=	gtkjj
PORTVERSION=	2.0.0
CATEGORIES=	deskutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	GTK client for posting JustJournal entries

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/../COPYING

WRKSRC=         ${WRKDIR}/justjournal-client-unix-2.0.0/gtk

USES=		pkgconfig
USE_GITHUB=     yes
GH_PROJECT=     justjournal-client-unix
GH_ACCOUNT=     laffer1
GH_TAGNAME=     ${PORTVERSION}
GH_COMMIT=      087a087
USE_CSTD=       c99

CFLAGS+=        -I/usr/local/include
LDFLAGS+=       -L/usr/local/lib -lxmlrpc_client -lxmlrpc -lxmlrpc_xmlparse

LIB_DEPENDS=	xmlrpc_client.so:${PORTSDIR}/net/xmlrpc-c
USE_GNOME=	gtk30
WANT_GNOME=	yes

.include <bsd.port.mk>
