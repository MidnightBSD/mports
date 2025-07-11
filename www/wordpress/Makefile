PORTNAME=	wordpress
DISTVERSION=	6.7.2
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	https://wordpress.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	State-of-the-art semantic personal publishing platform

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/license.txt

NO_ARCH=	yes
NO_BUILD=	yes
USES=		php:web cpe
USE_PHP=	curl exif fileinfo ftp gd hash json mysqli pcre tokenizer xml zip zlib
RUN_DEPENDS=	${LOCALBASE}/lib/php/${PHP_EXT_DIR}/imagick.so:graphics/pecl-imagick@${PHP_FLAVOR}
WRKSRC=		${WRKDIR}/${PORTNAME}

.if ${DISTVERSION:N*.*.*}
CPE_VERSION=	${DISTVERSION}.0
.endif

SUB_FILES=	pkg-message
PLIST=		${WRKDIR}/pkg-plist
PORTDOCS=	readme.html

OPTIONS_DEFINE=	DOCS

pre-everything::
	@${ECHO_CMD} "If you want to upgrade, you must read upgrade document."
	@${ECHO_CMD} ""
.  if !(defined(PACKAGE_BUILDING) || defined(BATCH))
	@sleep 1
.  endif

pre-install:
	${ECHO_CMD} '@owner www' > ${PLIST}
	${ECHO_CMD} '@group www' >> ${PLIST}
	cd ${WRKSRC}/ && ${FIND} -s * -type f | ${SED} -e 's|^|%%WWWDIR%%/|' >> ${PLIST}
	${ECHO_CMD} '@owner' >> ${PLIST}
	${ECHO_CMD} '@group' >> ${PLIST}
	if [ ! -f ${WRKSRC}/wp-config-sample.php ]; then ${CP} \
		${WRKSRC}/wp-config.php.sample ${WRKSRC}/wp-config.php; fi

do-install:
	${INSTALL} -d -m 755 ${STAGEDIR}${WWWDIR}/
	${CP} -R ${WRKSRC}/ ${STAGEDIR}${WWWDIR}/
	${FIND} ${STAGEDIR}${WWWDIR}/ -type d -exec ${CHMOD} g+w {} \;
	${MKDIR} ${STAGEDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR}/

.include <bsd.port.mk>
