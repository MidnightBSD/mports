PORTNAME=	viewvc
DISTVERSION=	1.1.27
PORTREVISION=	1
CATEGORIES=	devel python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web-based Version Control Repository Browsing

LICENSE=	bsd2

USES=		cpe python:2.7

NO_OPTIONS_SORT=	yes
OPTIONS_DEFINE=		WEBSRV APMOD SVN MYSQL
OPTIONS_DEFAULT=	WEBSRV APACHE SVN

OPTIONS_SINGLE=		WEBSRV APMOD
OPTIONS_SINGLE_WEBSRV=	APACHE LIGHTTPD
OPTIONS_SINGLE_APMOD=	MODPYTHON3 MODWSGI3

WEBSRV_DESC=	Enable web server support
APMOD_DESC=	Enable Apache module OPTIONS
APMOD_DESC=	depend on optional Apache module

MODWSGI3_DESC=	Enable mod_wsgi3 support
MODPYTHON3_DESC=Enable mod_python3 support

USE_GITHUB=	yes
CPE_VENDOR=	viewvc
CPE_PRODUCT=	viewvc

NO_BUILD=	yes
USE_RC_SUBR=	viewvc
SUB_FILES=	pkg-message
SUB_LIST=	INSTDIR="${PREFIX}/${INSTDIR}" \
		PYTHON_CMD=${PYTHON_CMD} \
		ECHO=${ECHO} EGREP=${EGREP} TOUCH=${TOUCH} \
		CHOWN=${CHOWN} RM=${RM}

INSTDIR?=	${PORTNAME}
PLIST_SUB=	INSTDIR=${INSTDIR}

.include <bsd.mport.options.mk>

RUN_DEPENDS+=	${LOCALBASE}/bin/pygmentize:textproc/py-pygments@${PY_FLAVOR}

# viewvc supports CVS and SVN, controlled with the parameter
# cvs_roots (for CVS), svn_roots (for Subversion) in viewvc.conf
.if ${PORT_OPTIONS:MSVN}
RUN_DEPENDS+=	${PYTHON_LIBDIR}/site-packages/svn/__init__.py:devel/py-subversion@${PY_FLAVOR}
.endif

.if ${PORT_OPTIONS:MAPACHE}
USE_APACHE_RUN=	22+
.endif

.if ${PORT_OPTIONS:MLIGHTTPD}
RUN_DEPENDS+=	lighttpd:www/lighttpd
.endif

.if ${PORT_OPTIONS:MMODPYTHON3}
RUN_DEPENDS+=	${APACHE_PKGNAMEPREFIX}mod_python>=3.3:www/mod_python3
.endif

.if ${PORT_OPTIONS:MMODWSGI3}
RUN_DEPENDS+=	${APACHE_PKGNAMEPREFIX}mod_wsgi>=3.3:www/mod_wsgi3
.endif

# This feature is a clone of the Mozilla Project's Bonsai database.
# It catalogs every commit in the CVS or Subversion repository into a MYSQL database.
# In fact, the databases are 100% compatible.
.if ${PORT_OPTIONS:MMYSQL}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}MySQLdb>=0:databases/py-MySQLdb@${PY_FLAVOR}
.endif

pre-everything::
.if ${PORT_OPTIONS:MAPMOD} && empty(PORT_OPTIONS:MAPACHE)
IGNORE=	apache module needs Apache server, please re-run 'make config' then choose WEBSRV and APACHE
. endif

post-patch:
.for i in cvsgraph.conf mimetypes.conf viewvc.conf
	${MV} ${WRKSRC}/conf/${i}.dist ${WRKSRC}/conf/${i}.sample
	${REINPLACE_CMD} -e '/"${i}"/d' ${WRKSRC}/viewvc-install
.endfor
	${REINPLACE_CMD} -e 's/conf.dist/conf.sample/g' \
              ${WRKSRC}/viewvc-install \
              ${WRKSRC}/bin/standalone.py
# to much files, use own shebangfix
	${FIND} ${WRKSRC} -type f | ${GREP} -v -e 'png' -e 'images' \
             | ${XARGS} ${SED} -i '' \
              -e '1s|^\#![[:space:]]*/usr/bin/env python|\#!${PYTHON_CMD}|' \
              -e '1s|^\#![[:space:]]*/usr/bin/python|\#!${PYTHON_CMD}|'

do-install:
#in a perfect world, we could use destdir, but some parts don't honor it
	@(cd ${WRKSRC} && ${PYTHON_CMD} viewvc-install --prefix=${PREFIX}/${INSTDIR} --destdir="" --clean-mode=false)
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
		${PREFIX}/viewvc/bin/cgi/viewvc.cgi \
		${PREFIX}/viewvc/bin/cgi/query.cgi \
		${PREFIX}/viewvc/bin/mod_python/viewvc.py \
		${PREFIX}/viewvc/bin/mod_python/query.py \
		${PREFIX}/viewvc/bin/standalone.py \
		${PREFIX}/viewvc/bin/loginfo-handler \
		${PREFIX}/viewvc/bin/cvsdbadmin \
		${PREFIX}/viewvc/bin/svndbadmin \
		${PREFIX}/viewvc/bin/wsgi/query.fcgi \
		${PREFIX}/viewvc/bin/wsgi/query.wsgi \
		${PREFIX}/viewvc/bin/wsgi/viewvc.fcgi \
		${PREFIX}/viewvc/bin/wsgi/viewvc.wsgi

.include <bsd.port.mk>
