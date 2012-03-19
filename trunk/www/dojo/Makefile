# $MidnightBSD: mports/www/dojo/Makefile,v 1.7 2011/09/01 01:23:49 laffer1 Exp $

PORTNAME=	dojo
PORTVERSION=	1.6.0
CATEGORIES=	www
MASTER_SITES=	http://download.dojotoolkit.org/release-${PORTVERSION}/ \
		FREEBSD_LOCAL/glarkin
DISTNAME=	dojo-release-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source DHTML toolkit written in JavaScript
LICENSE=	bsd3

NO_BUILD=	yes

OPTIONS=	APACHE  "Configure for Apache-2.x" off

.include <bsd.port.pre.mk>

PLIST_SUB+=	WWWDIR=www/${PORTNAME}

.if defined(WITH_APACHE)
USE_APACHE=	2.0+
CONFDIR=	${PREFIX}/${CONFDIR_REL}
CONFDIR_REL=	${APACHEETCDIR}/Includes
PLIST_SUB+=	NOAPACHE="" CONFDIR=${CONFDIR_REL}
CONF=		dojo.conf
SUB_FILES+=	pkg-message ${CONF}
.else
PLIST_SUB+=	NOAPACHE="@comment "
.endif

do-install:
	@${MKDIR} ${PREFIX}/www/${PORTNAME}
	(cd ${WRKSRC} && pax -rw . ${PREFIX}/www/${PORTNAME})
	@${CHOWN} -R ${WWWOWN}:${WWWGRP} ${PREFIX}/www/${PORTNAME}
	@${FIND} ${PREFIX}/www/${PORTNAME} -type f -print0 | ${XARGS} -0 ${CHMOD} 644
	@${FIND} ${PREFIX}/www/${PORTNAME} -type d -print0 | ${XARGS} -0 ${CHMOD} 755

.if defined(WITH_APACHE)
post-install:
	@if [ -d "${CONFDIR}" ]; then \
	  ${CP} ${WRKDIR}/${CONF} ${CONFDIR}/dojo.conf; \
	else \
	  ${ECHO_MSG} "" ; \
	  ${ECHO_MSG} "Please check your Apache 2.x installation -" ; \
	  ${ECHO_MSG} "${CONFDIR} doesn't exist," ; \
	  ${ECHO_MSG} "so I cannot install ${CONF} there!" ; \
	  ${ECHO_MSG} "" ; \
	  ${FALSE} ; \
	fi
.endif

.include <bsd.port.post.mk>
