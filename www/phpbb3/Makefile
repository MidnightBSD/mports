PORTNAME=	phpbb
DISTVERSION=	3.3.14
CATEGORIES=	www
MASTER_SITES=	https://download.phpbb.com/pub/release/${PORTVERSION:C/([0-9]+\.[0-9]+).*/\1/}/${PORTVERSION}/
PKGNAMESUFFIX=	3
DISTNAME=	phpBB-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PHP-based bulletin board / discussion forum system
WWW=		https://www.phpbb.com/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/docs/LICENSE.txt

USES=		cpe php tar:bzip2
USE_PHP=	ctype dom filter tokenizer

CONFLICTS=	phpbb-[0-2]*

OPTIONS_DEFINE=	DOCS

WWWDOCROOT?=	www
PHPBBURL?=	phpBB3

WRKSRC=		${WRKDIR}/phpBB3
NO_BUILD=	yes
NO_ARCH=	yes
SUB_FILES=	pkg-message
SUB_LIST=	PHPBBURL="${PHPBBURL}" \
		PHPBBDIR="${PHPBBDIR}"

PLIST_SUB+=	PHPBBDIR=${PHPBBDIR} WWWOWN=${WWWOWN} WWWGRP=${WWWGRP}

PHPBBDIR=	${WWWDOCROOT}/${PHPBBURL}
PKGOPTS=	${FILESDIR}/pkg-opts
PORTDOCS=	*

options:
	@${ECHO_MSG} "===>  Build options for ${PKGNAME}:"
	@${CAT} ${PKGOPTS}

pre-everything::
.if !defined(BATCH)
	@${TEST} -r ${PKGOPTS} && \
	  (${ECHO_MSG} '-------------------------------------------------------------------------'; \
	   ${ECHO_MSG} 'Perform a "make options" to see a list of available installation options.'; \
	   ${ECHO_MSG} '-------------------------------------------------------------------------')
.endif

do-install:
	${MV} ${WRKSRC}/config.php ${WRKSRC}/config.php.sample
	cd ${WRKSRC} && ${COPYTREE_SHARE} . ${PREFIX}/${PHPBBDIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
