PORTNAME=	httperf
PORTVERSION=	0.9.1
CATEGORIES=	benchmarks www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for measuring webserver performance
WWW=		https://github.com/httperf/httperf

LICENSE=        gpl2

USES=		autoreconf gmake libtool ssl
USE_GITHUB=	yes
GH_TAGNAME=	568322e
GNU_CONFIGURE=	yes
MAKE_ARGS=	LIBUTIL_OBJS=ssl_writev.o \
		exec_prefix=${PREFIX}

PLIST_FILES=	bin/httperf man/man1/httperf.1.gz
.if !defined(NOPORTDOCS)
PORTDOCS=	ChangeLog NEWS README TODO
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${PORTDOCS}
	${INSTALL_MAN} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

do-install:
	@${INSTALL_MAN} ${WRKSRC}/man/${PORTNAME}.1 ${MAN1PREFIX}/man/man1/
	@${INSTALL_PROGRAM} ${WRKSRC}/src/${PORTNAME} ${PREFIX}/bin/

.include <bsd.port.mk>
