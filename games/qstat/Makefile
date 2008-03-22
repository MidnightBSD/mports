# New ports collection makefile for:	QStat
# Date created:				28 May 1998
# Whom:					Daniel O'Connor <darius@dons.net.au>
#
# $MidnightBSD: mports/games/qstat/Makefile,v 1.4 2008/03/22 16:13:29 laffer1 Exp $
# $FreeBSD: ports/games/qstat/Makefile,v 1.23 2006/04/17 08:13:21 danfe Exp $
#

PORTNAME=	qstat
PORTVERSION=	2.11
PORTREVISION=	1
CATEGORIES=	games net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A command line program to query game servers on the net
LICENSE=	artistic

GNU_CONFIGURE=	yes

post-extract:
	@${MV} ${WRKSRC}/qstat.cfg ${WRKSRC}/qstat.cfg.default

post-patch:
	@${REINPLACE_CMD} -e 's|\(qstat\.cfg\)|\1\.default|' \
		${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/info ${DOCSDIR}/template
	${INSTALL_DATA} ${WRKSRC}/qstatdoc.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/template/*.html ${WRKSRC}/template/*.txt \
		${DOCSDIR}/template
	${INSTALL_DATA} ${WRKSRC}/info/*.txt ${DOCSDIR}/info
.endif

.include <bsd.port.mk>
