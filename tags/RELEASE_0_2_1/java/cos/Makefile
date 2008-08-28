# New ports collection makefile for:	cos
# Date created:		1999/07/05
# Whom:			Jose Marques <noway@nohow.demon.co.uk>
#
# $MidnightBSD$
# $FreeBSD: ports/java/cos/Makefile,v 1.13 2005/02/13 21:20:52 hq Exp $
#

PORTNAME=	cos
PORTVERSION=	2002.11.05
PORTEPOCH=	1
CATEGORIES=	java devel
MASTER_SITES=	http://www.servlets.com/cos/ \
		http://www.oreilly.com.tw/bookcode/
DISTNAME=	${PORTNAME}-05Nov2002

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The O\'Reilly package of utility classes for servlet developers

USE_ZIP=	yes
NO_WRKSUBDIR=	yes
USE_JAVA=	yes
NO_BUILD=	yes
RESTRICTED=	"Special conditions apply for commercial use, see licence"
DATAFILES=	readme.txt license.txt doc
DATADIR=	${JAVASHAREDIR}/${PORTNAME}

do-install:
	@${INSTALL_DATA} ${WRKSRC}/lib/cos.jar ${JAVAJARDIR}/
	@cd ${WRKSRC} \
	  && ${FIND} ${DATAFILES} -type d -exec ${MKDIR} ${DATADIR}/{} \; \
	  && ${FIND} ${DATAFILES} -type f -exec ${INSTALL_DATA} {} ${DATADIR}/{} \;
	@${INSTALL_DATA} ${WRKSRC}/upload.war ${DATADIR}/doc

.include <bsd.port.mk>
