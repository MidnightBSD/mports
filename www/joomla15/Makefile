# $MidnightBSD: mports/www/joomla15/Makefile,v 1.2 2010/04/28 00:36:40 laffer1 Exp $
# $FreeBSD: ports/www/joomla15/Makefile,v 1.25 2009/08/07 20:07:40 skreuzer Exp $

PORTNAME=	joomla15
PORTVERSION=	1.5.18
CATEGORIES=	www
MASTER_SITES=	http://joomlacode.org/gf/download/frsrelease/12350/51109/ \
		http://web.dti.supsi.ch/downloads/
DISTNAME=	Joomla_${PORTVERSION}-Stable-Full_Package

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dynamic web content management system (CMS)
LICENSE=	gpl2

FETCH_CMD=	fetch -Rr
USE_BZIP2=	yes
NO_BUILD=	yes
USE_MYSQL=	yes
USE_PHP=	mysql pcre xml zlib session gd pdf
WANT_PHP_WEB=	yes
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_FILES=	pkg-message

do-extract:
	@${MKDIR} ${WRKSRC}
	@${TAR} -yxf ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} -C ${WRKSRC}

do-install:
	@${MKDIR} ${WWWDIR}
	@cd ${WRKSRC} && \
		${FIND} . -type d -exec ${MKDIR} ${WWWDIR}/{} \; \
			-exec ${CHOWN} ${WWWOWN}:${WWWGRP} ${WWWDIR}/{} \;
	@cd ${WRKSRC} && \
		${FIND} . \! -type d -exec ${INSTALL_DATA} {} ${WWWDIR}/{} \; \
			-exec ${CHOWN} ${WWWOWN}:${WWWGRP} ${WWWDIR}/{} \;

.include <bsd.port.mk>
