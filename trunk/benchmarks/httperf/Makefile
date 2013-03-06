# $MidnightBSD: mports/benchmarks/httperf/Makefile,v 1.2 2008/07/18 21:15:52 crash Exp $

PORTNAME=	httperf
PORTVERSION=	0.9.0
CATEGORIES=	benchmarks www
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tool for measuring webserver performance
LICENSE=        gpl
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
MAKE_ARGS=	LIBUTIL_OBJS=ssl_writev.o \
		exec_prefix=${PREFIX}

PLIST_FILES=	bin/httperf
.if !defined(NOPORTDOCS)
PORTDOCS=	ChangeLog NEWS README TODO
.endif
MAN1=		httperf.1

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
