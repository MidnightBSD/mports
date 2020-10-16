PORTNAME=	mattermost-webapp
PORTVERSION=	5.26.1
DISTVERSIONPREFIX=	v
CATEGORIES=	www
MASTER_SITES=	https://releases.mattermost.com/${PORTVERSION}/
DISTNAME=	mattermost-${PORTVERSION}-linux-amd64

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Webapp of Mattermost server

LICENSE=	apache2

NO_BUILD=	yes
NO_ARCH=	yes

WWWDIR=		${PREFIX}/www/mattermost

MATTERMOSTD_USER=	mattermost
MATTERMOSTD_GROUP=	mattermost

USERS=		${MATTERMOSTD_USER}
GROUPS=		${MATTERMOSTD_GROUP}

PLIST_SUB=	MATTERMOSTD_USER=${MATTERMOSTD_USER} \
			MATTERMOSTD_GROUP=${MATTERMOSTD_GROUP}

do-install:
	${MKDIR} ${STAGEDIR}${WWWDIR}
	cd ${WRKDIR}/mattermost && ${COPYTREE_SHARE} client ${STAGEDIR}${WWWDIR}
	${MKDIR} ${STAGEDIR}${WWWDIR}/client/plugins

.include <bsd.port.mk>
