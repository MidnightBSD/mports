PORTNAME=	pmwiki
PORTVERSION=	2.4.1
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	http://www.pmwiki.org/pub/pmwiki/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WikiWikiWeb clone using PHP
WWW=		https://www.pmwiki.org

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/docs/COPYING.txt

USES=		cpe tar:tgz php:web
USE_PHP=	mbstring session

NO_BUILD=	yes
NO_ARCH=	yes

PORTDOCS=	*

FETCH_ARGS=	-pRr
PLIST_SUB+=	PMWIKIDIR=${PMWIKIDIR} WWWGRP=${WWWGRP} WWWOWN=${WWWOWN}
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

CPIOFLAGS=	--quiet -pdm -R ${WWWOWN}:${WWWGRP}

post-extract:
	@${MV} ${WRKSRC}/README.txt ${WRKSRC}/docs
	@${MV} ${WRKSRC}/docs/sample-config.php ${WRKSRC}

do-install:
	@${MKDIR} -m 755 ${PREFIX}/${PMWIKIDIR}
	@cd ${WRKSRC} && ${FIND} . ! \( -name docs -prune \) | \
		${CPIO} ${CPIOFLAGS} ${PREFIX}/${PMWIKIDIR}
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${PREFIX}/${PMWIKIDIR}
.if !defined(NOPORTDOCS)
	@${INSTALL} -o ${DOCOWN} -g ${DOCGRP} -m 555 -d ${DOCSDIR}
	@${INSTALL_MAN} ${WRKSRC}/docs/* ${DOCSDIR}
.endif

post-install:
	@${MKDIR} -m 775 ${PREFIX}/${PMWIKIDIR}/wiki.d
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${PREFIX}/${PMWIKIDIR}/wiki.d

.include <bsd.port.mk>
