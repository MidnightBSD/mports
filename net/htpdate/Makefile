PORTNAME=	htpdate
PORTVERSION=	1.3.7
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://www.vervest.org/htp/archive/c/ \
		http://twekkel.home.xs4all.nl/htp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Time synchronization over http utility
WWW=		https://github.com/twekkel/htpdate

LICENSE=	gpl2+

GH_ACCOUNT=	twekkel

MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}"

PLIST_FILES=	bin/${PORTNAME} share/man/man8/${PORTNAME}.8.gz
PORTDOCS=	Changelog README.md
USE_RC_SUBR=	${PORTNAME}

OPTIONS_DEFINE=	DOCS SSL
OPTIONS_DEFAULT=	SSL

SSL_USES=	ssl
SSL_CFLAGS=	-DENABLE_HTTPS
SSL_LDFLAGS=	-lssl

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.8 ${STAGEDIR}${PREFIX}/share/man/man8

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTEDIR}${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
