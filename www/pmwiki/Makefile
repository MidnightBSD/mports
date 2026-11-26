PORTNAME=	pmwiki
DISTVERSION=	2.7.3
PORTREVISION=	0
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	http://www.pmwiki.org/pub/pmwiki/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WikiWikiWeb clone using PHP
WWW=		https://www.pmwiki.org

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/docs/COPYING.txt

USES=		cpe php:web tar:tgz
USE_PHP=	mbstring session

NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	pkg-message
SUB_LIST=	PMWIKIDIR=${PMWIKIDIR}
PLIST_SUB=	PMWIKIDIR=${PMWIKIDIR} WWWGRP=${WWWGRP} WWWOWN=${WWWOWN}
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

pre-fetch:
.if !defined(PMWIKIDIR)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Define PMWIKIDIR (now: ${PMWIKIDIR})"
	@${ECHO_MSG} "to override default: www/pmwiki".
	@${ECHO_MSG} ""
.endif

PMWIKIDIR?=	www/pmwiki

CPIOFLAGS=	--quiet -pdm -R ${WWWOWN}:${WWWGRP}

post-extract:
	@${MV} ${WRKSRC}/README.txt ${WRKSRC}/docs
	@${MV} ${WRKSRC}/docs/sample-config.php ${WRKSRC}

do-install:
	@${MKDIR} -m 755 ${PREFIX}/${PMWIKIDIR}
	@cd ${WRKSRC} && ${FIND} . ! \( -name docs -prune \) | \
		${CPIO} ${CPIOFLAGS} ${PREFIX}/${PMWIKIDIR}
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${PREFIX}/${PMWIKIDIR}

do-install-DOCS-on:
	@${INSTALL} -o ${DOCOWN} -g ${DOCGRP} -m 555 -d ${FAKE_DESTDIR}${DOCSDIR}
	@${INSTALL_MAN} ${WRKSRC}/docs/* ${FAKE_DESTDIR}${DOCSDIR}

post-install:
	@${MKDIR} -m 775 ${PREFIX}/${PMWIKIDIR}/wiki.d
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${PREFIX}/${PMWIKIDIR}/wiki.d

.include <bsd.port.mk>
