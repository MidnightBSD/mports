# $MidnightBSD$
# $FreeBSD: ports/www/joomla/Makefile,v 1.15 2008/06/01 11:26:57 miwi Exp $

PORTNAME=	joomla
PORTVERSION=	1.0.15
CATEGORIES=	www
MASTER_SITES=	http://downloads.joomlacode.org/frsrelease/2/2/5/22536/
DISTNAME=	Joomla_${PORTVERSION}-Stable-Full_Package
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dynamic web content management system (CMS)
LICENSE=	gpl2

NO_BUILD=	yes
USE_BZIP2=	yes
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
