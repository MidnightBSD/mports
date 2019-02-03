# $MidnightBSD$
# $FreeBSD: head/www/mod_wsgi4/Makefile 432447 2017-01-25 16:32:15Z sunpoet $

PORTNAME=	mod_wsgi
PORTVERSION=	4.5.14
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMESUFFIX=	4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python WSGI adapter module for Apache

LICENSE=	apache2

CONFLICTS_INSTALL=${PKGNAMEPREFIX}mod_wsgi3.* mod_wsgi3.*

USE_APACHE=	24
USES=		gettext python

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-apxs="${APXS}" --with-python="${PYTHON_CMD}"

SUB_FILES=	pkg-message ${APMOD_FILE}
APMOD_FILE=	270_${PORTNAME}.conf.sample
PLIST_SUB+=	APMOD_FILE=${APMOD_FILE}

pre-everything::
	@${ECHO_MSG} "======================= ATTENTION! ======================"
	@${ECHO_MSG}
	@${ECHO_MSG} "If you want to use daemon mode you will need to make sure"
	@${ECHO_MSG} "Apache and APR include thread support."
	@${ECHO_MSG}
	@${ECHO_MSG} "========================================================="

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${APACHEETCDIR}/modules.d
	${INSTALL_DATA} ${WRKDIR}/${APMOD_FILE} ${STAGEDIR}${PREFIX}/${APACHEETCDIR}/modules.d
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${APACHEMODDIR}/${PORTNAME}.so

.include <bsd.port.mk>
