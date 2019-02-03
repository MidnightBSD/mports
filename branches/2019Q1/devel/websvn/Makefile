# $MidnightBSD$

PORTNAME=	websvn
PORTVERSION=	2.3.3
CATEGORIES=	devel www
MASTER_SITES=	http://websvn.tigris.org/files/documents/1380/49056/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Subversion repository web frontend

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/license.txt

USES=		cpe
USE_PHP=	iconv pcre xml
NO_BUILD=	yes

WEBSVNDIR?=	www/data/websvn
PLIST=		${WRKDIR}/pkg-plist

SUB_FILES=	pkg-message
SUB_LIST+=	WEBSVNDIR="${WEBSVNDIR}"
PLIST_SUB+=	WEBSVNDIR="${WEBSVNDIR}"

do-install:
	${MKDIR} ${PREFIX}/${WEBSVNDIR}
	(cd ${WRKSRC} \
	    && ${COPYTREE_SHARE} \* ${PREFIX}/${WEBSVNDIR})
	${CHOWN} -R www:www ${PREFIX}/${WEBSVNDIR}
	${FIND} ${PREFIX}/${WEBSVNDIR} -type f -exec ${CHMOD} 644 '{}' +

post-install:
	@${CAT} ${PKGMESSAGE}
	@[ -f ${PREFIX}/${WEBSVNDIR}/include/config.php ] \
	    || ${INSTALL_DATA} \
	    ${PREFIX}/${WEBSVNDIR}/include/distconfig.php \
	    ${PREFIX}/${WEBSVNDIR}/include/config.php

.include <bsd.port.mk>
