PORTNAME=	clamd-stream-client
DISTVERSION=	1.3
CATEGORIES=	security
MASTER_SITES=	SF/clamd-stream-cl/${PORTNAME}/${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standalone clamav client
WWW=		http://clamd-stream-cl.sourceforge.net/

HAS_CONFIGURE=	yes
PLIST_FILES=	bin/clamd-stream-client

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
