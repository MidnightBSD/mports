PORTNAME=	dojo
PORTVERSION=	1.12.2
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	http://download.dojotoolkit.org/release-${PORTVERSION}/
DISTNAME=	dojo-release-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source DHTML toolkit written in JavaScript
WWW=		https://dojotoolkit.org/

LICENSE=	bsd3

USES=		cpe
CPE_VENDOR=	linuxfoundation

NO_BUILD=	yes
SHAREOWN=	www
SHAREGRP=	www

OPTIONS_DEFINE=		APACHE
OPTIONS_SUB=		yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MAPACHE}
USES+=			apache:run,2.4+ cpe
CONFDIR=		${PREFIX}/${CONFDIR_REL}
CONFDIR_REL=		${APACHEETCDIR}/Includes
PLIST_SUB+=		CONFDIR=${CONFDIR_REL}

CONF=			dojo.conf
SUB_FILES+=		pkg-message ${CONF}
.endif

do-install:
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${WWWDIR}

.if ${PORT_OPTIONS:MAPACHE}
	@${MKDIR} ${STAGEDIR}${CONFDIR}
	${CP} ${WRKDIR}/${CONF} ${STAGEDIR}${CONFDIR}/dojo.conf.sample
.endif

.include <bsd.port.mk>
