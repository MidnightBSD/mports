# New ports collection makefile for:	wmScoreBoard
# Date created:				Sun Jun 24 17:08:15 EDT 2001
# Whom:					Patrick Li <pat@databits.net>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/wmScoreBoard/Makefile,v 1.6 2006/04/14 22:53:07 linimon Exp $
#

PORTNAME=	wmScoreBoard
PORTVERSION=	0.30
PORTREVISION=	3
CATEGORIES=	misc windowmaker
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	pat

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Window Maker dockapp that display game scores from excite
LICENSE=	gpl2

RUN_DEPENDS=	wget:${PORTSDIR}/ftp/wget

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}/src
USE_GMAKE=	yes
USE_XORG=	xpm

.include <bsd.mport.options.mk>

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for docs in BUGS CHANGES HINTS README
	@${INSTALL_DATA} ${WRKSRC}/../${docs} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
