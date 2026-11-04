PORTNAME=	httperf
PORTVERSION=	0.9.1
PORTREVISION=	1
CATEGORIES=	benchmarks www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for measuring webserver performance
WWW=		https://github.com/httperf/httperf

LICENSE=        gpl2

GNU_CONFIGURE=	yes
USES=		autoreconf gmake libtool ssl
USE_GITHUB=	yes
GH_TAGNAME=	568322e
MAKE_ARGS=	LIBUTIL_OBJS=ssl_writev.o \
		exec_prefix=${PREFIX}

PLIST_FILES=	bin/httperf \
		share/man/man1/httperf.1.gz
PORTDOCS=	ChangeLog NEWS README TODO

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_MAN} ${WRKSRC}/man/${PORTNAME}.1 \
		${PREFIX}/share/man/man1
	${INSTALL_PROGRAM} ${WRKSRC}/src/${PORTNAME} ${PREFIX}/bin/

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
