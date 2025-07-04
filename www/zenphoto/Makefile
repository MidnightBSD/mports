PORTNAME=	zenphoto
PORTVERSION=	1.5.9
DISTVERSIONPREFIX=	v
PORTREVISION=	3
CATEGORIES=	www
PKGNAMESUFFIX=	${PHP_PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simpler web photo gallery
WWW=		https://www.zenphoto.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe php:flavors,web
USE_PHP=	gd gettext hash json mbstring mysqli pcre session

NO_ARCH=	yes
NO_BUILD=	yes

SUB_FILES=	pkg-deinstall pkg-message

USE_GITHUB=	yes

post-patch:
	@${RM} -fr ${WRKSRC}/.github/
	@${MKDIR} ${WRKSRC}/cache/
	@${FIND} ${WRKSRC} -name '.git*' -delete
	@${RM} ${WRKSRC}/zp-core/Zenphoto.package

do-install:
	${MKDIR} ${STAGEDIR}${WWWDIR}/
	cd ${WRKSRC}/ && ${COPYTREE_SHARE} . ${STAGEDIR}${WWWDIR}/

# maintainer section:

MS_PLIST=	${WRKDIR}/.ms-pkg-plist

genplist: do-clean extract patch
	@${ECHO_CMD} '@owner www' > ${MS_PLIST}
	@${ECHO_CMD} '@group www' >> ${MS_PLIST}
	@cd ${WRKSRC}/ && ${FIND} -s * -type f | ${SORT} | ${SED} 's|^|%%WWWDIR%%/|' >> ${MS_PLIST}
	@cd ${WRKSRC}/ && (${FIND} -s * -type d -empty | ${XARGS} -I _ ${ECHO_CMD} '@dir %%WWWDIR%%/_') >> ${MS_PLIST}
	@${ECHO_CMD} '@owner' >> ${MS_PLIST}
	@${ECHO_CMD} '@group' >> ${MS_PLIST}
	@${INSTALL} -m 600 ${MS_PLIST} ${PLIST}

.include <bsd.port.mk>
