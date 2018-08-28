# $MidnightBSD$

PORTNAME=	qstat
PORTVERSION=	2.11
PORTREVISION=	2
CATEGORIES=	games net
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A command line program to query game servers on the net
LICENSE=	artistic

GNU_CONFIGURE=	yes

post-extract:
	@${MV} ${WRKSRC}/qstat.cfg ${WRKSRC}/qstat.cfg.default

post-patch:
	@${REINPLACE_CMD} -e 's|\(qstat\.cfg\)|\1\.default|' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|OpenBSD|MidnightBSD|' ${WRKSRC}/qstat.c

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/info ${DOCSDIR}/template
	${INSTALL_DATA} ${WRKSRC}/qstatdoc.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/template/*.html ${WRKSRC}/template/*.txt \
		${DOCSDIR}/template
	${INSTALL_DATA} ${WRKSRC}/info/*.txt ${DOCSDIR}/info
.endif

.include <bsd.port.mk>
