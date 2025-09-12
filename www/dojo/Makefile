PORTNAME=	dojo
PORTVERSION=	1.12.3
CATEGORIES=	www
MASTER_SITES=	http://download.dojotoolkit.org/release-${PORTVERSION}/
DISTNAME=	dojo-release-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source DHTML toolkit written in JavaScript
WWW=		https://dojotoolkit.org/

LICENSE=	bsd3

USES=			cpe
CPE_VENDOR=		linuxfoundation

NO_ARCH=		yes
NO_BUILD=		yes
SHAREOWN=		www
SHAREGRP=		www

OPTIONS_DEFINE=		APACHE
OPTIONS_SUB=		yes

APACHE_USES=		apache:run cpe

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MAPACHE}
CONFDIR=		${PREFIX}/${CONFDIR_REL}
CONFDIR_REL=		${APACHEETCDIR}/Includes
PLIST_SUB+=		CONFDIR=${CONFDIR_REL}
CONF=			dojo.conf
SUB_FILES+=		pkg-message ${CONF}
.endif

do-install:
	cd ${WRKSRC} && ${COPYTREE_SHARE} . ${WWWDIR}

do-install-APACHE-on:
	@${MKDIR} ${FAKE_DESTDIR}${CONFDIR}
	${CP} ${WRKDIR}/${CONF} ${FAKE_DESTDIR}${CONFDIR}/dojo.conf.sample

.include <bsd.port.mk>
