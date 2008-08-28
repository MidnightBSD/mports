# New ports collection makefile for:	httperf
# Date created:		28 Jul 1999
# Whom:			Will Andrews <andrews@technologist.com>
#
# $FreeBSD: ports/benchmarks/httperf/Makefile,v 1.20 2006/04/05 21:04:28 jmelo Exp $
# $MidnightBSD: mports/benchmarks/httperf/Makefile,v 1.1 2007/01/07 18:57:56 laffer1 Exp $
#

PORTNAME=	httperf
PORTVERSION=	0.9.0
CATEGORIES=	benchmarks www
MASTER_SITES=	ftp://ftp.hpl.hp.com/pub/httperf/

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
