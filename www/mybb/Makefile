PORTNAME=	mybb
DISTVERSION=	1.8.33
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PHP-based bulletin board / discussion forum system
WWW=		https://mybboard.net/

LICENSE=	gpl3

USE_GITHUB=	yes
GH_TAGNAME=	${PORTNAME}_1832

USES=		cpe mysql php:web
NO_BUILD=	yes
NO_ARCH=	yes
USE_PHP=	xsl mysqli iconv gd xml
SUB_FILES=	pkg-message
WWWDIR?=	${PREFIX}/www/${PORTNAME}
PLIST_SUB=	WWWOWN=${WWWOWN}

do-install:
	@${MKDIR} ${WWWDIR}
	${CP} -R ${WRKSRC}/ ${WWWDIR}
#	${TOUCH} ${WWWDIR}/inc/config.php.sample
	${MV} ${WWWDIR}/inc/settings.php \
		${WWWDIR}/inc/settings.php.sample

.include <bsd.port.mk>
