PORTNAME=	mod_wsgi
DISTVERSION=	5.0.2
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python WSGI adapter module for Apache
WWW=		https://www.modwsgi.org/

LICENSE=	Apache-2.0

USES=		apache cpe gettext python
USE_PYTHON=	flavors
CPE_VENDOR=	modwsgi

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
	@${MKDIR} ${PREFIX}/${APACHEETCDIR}/modules.d
	${INSTALL_DATA} ${WRKDIR}/${APMOD_FILE} ${PREFIX}/${APACHEETCDIR}/modules.d
	${STRIP_CMD} ${PREFIX}/${APACHEMODDIR}/${PORTNAME}.so

.include <bsd.port.mk>
