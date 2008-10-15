# New ports collection makefile for:	www/mediawiki
# Date created:				February 1st 2005
# Whom:	      				Gerrit Beine <tux@pinguru.net>
#
# $MidnightBSD$
# $FreeBSD: ports/www/mediawiki/Makefile,v 1.48 2008/10/05 11:24:08 miwi Exp $
#

PORTNAME=	mediawiki
PORTVERSION=	1.13.2
CATEGORIES=	www
MASTER_SITES=	http://download.wikimedia.org/mediawiki/1.13/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The wiki engine used by Wikipedia
LICENSE=	gpl2

USE_PHP=	iconv mbstring pcre session xml zlib readline dom
WANT_PHP_WEB=	yes
MEDIAWIKIDIR?=	www/mediawiki

OPTIONS=	PGSQL "Use PostgreSQL (instead of MySQL)" off \
		LDAP "Use LDAP authentication" off \
		TEXVC "Use built-in TeX rendering" off \
		IMAGICK "Use ImageMagick" off

.include <bsd.port.pre.mk>

.if defined(WITH_PGSQL)
USE_PHP+=	pgsql
.else
IGNORE_WITH_MYSQL=	323
USE_MYSQL=	yes
USE_PHP+=	mysql
.endif

.if defined(WITH_LDAP)
USE_PHP+=	ldap
.endif

.if defined(WITH_TEXVC)
RUN_DEPENDS+=	latex:${PORTSDIR}/print/latex
BUILD_DEPENDS+=	ocaml:${PORTSDIR}/lang/ocaml

USE_GMAKE=yes
WITH_IMAGICK=yes
.endif

.if defined(WITH_IMAGICK)
RUN_DEPENDS+=	${LOCALBASE}/lib/php/${PHP_EXT_DIR}/imagick.so:${PORTSDIR}/graphics/pecl-imagick
.endif

RUN_DEPENDS+=	${LOCALBASE}/lib/php/${PHP_EXT_DIR}/eaccelerator.so:${PORTSDIR}/www/eaccelerator

do-build:
.if defined(WITH_TEXVC)
	@(cd ${WRKSRC}/math && ${GMAKE})
.endif

do-install:
	@${MKDIR} ${PREFIX}/${MEDIAWIKIDIR}
	${CP} -r ${WRKSRC}/ ${PREFIX}/${MEDIAWIKIDIR}
	${CHOWN} -R ${WWWOWN}:${WWWGRP} ${PREFIX}/${MEDIAWIKIDIR}

post-install:
	@${FIND} ${WRKSRC}/${file} -not -type d \
		| ${SED} -ne 's,^${WRKSRC},${MEDIAWIKIDIR},p' >> ${TMPPLIST}
	@${FIND} -d ${WRKSRC}/${file} -type d \
		| ${SED} -ne 's,^${WRKSRC},@dirrm ${MEDIAWIKIDIR},p' >> ${TMPPLIST}
	@${SED} -e 's|%%MEDIAWIKIDIR%%|${PREFIX}/${MEDIAWIKIDIR}|' ${PKGMESSAGE}

.include <bsd.port.post.mk>
