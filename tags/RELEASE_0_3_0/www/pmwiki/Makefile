# Ports collection makefile for:	PmWiki
# Date created:		Sat Feb 26 06:16:50 CST 2005
# Whom:				Jin-Shan Tseng <tjs@cdpa.nsysu.edu.tw>
#
# $MidnightBSD: mports/www/pmwiki/Makefile,v 1.3 2010/11/13 19:22:53 laffer1 Exp $
# $FreeBSD: ports/www/pmwiki/Makefile,v 1.18 2006/12/16 11:49:55 miwi Exp $
#

PORTNAME=	pmwiki
PORTVERSION=	2.2.17
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	MASTER_SITES= http://pmwiki.org/pub/pmwiki/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A WikiWikiWeb clone using PHP
LICENSE=	gpl2

USE_GCPIO=	yes
USE_PHP=	mbstring session
WANT_PHP_WEB=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}
NO_BUILD=	yes

PLIST_SUB+=	PMWIKIDIR=${PMWIKIDIR}
SUB_LIST+=	PMWIKIDIR=${PMWIKIDIR}
SUB_FILES=	pkg-message

pre-fetch:
.if !defined(PMWIKIDIR)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Define PMWIKIDIR (now: ${PMWIKIDIR})"
	@${ECHO_MSG} "to override default: www/pmwiki".
	@${ECHO_MSG} ""
.endif

PMWIKIDIR?=	www/pmwiki

post-extract:
	${MV} ${WRKSRC}/README.txt ${WRKSRC}/docs
	${MV} ${WRKSRC}/docs/sample-config.php ${WRKSRC}

do-install:
	@${MKDIR} -m 755 ${PREFIX}/${PMWIKIDIR}
	@${CP} -R ${WRKSRC}/ ${PREFIX}/${PMWIKIDIR}
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${PREFIX}/${PMWIKIDIR}

post-install:
	@${MKDIR} -m 775 ${PREFIX}/${PMWIKIDIR}/wiki.d
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${PREFIX}/${PMWIKIDIR}/wiki.d

.include <bsd.port.mk>
