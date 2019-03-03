# $MidnightBSD$

PORTNAME=	viewvc
PORTVERSION=	1.1.26
CATEGORIES=	devel python
MASTER_SITES=	http://www.viewvc.org/ \
		FREEBSD_LOCAL/ohauer

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web-based Version Control Repository Browsing

LICENSE=	bsd2

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

USES=		cpe
CPE_VENDOR=	viewvc
CPE_PRODUCT=	viewvc

NO_BUILD=	yes
USE_RC_SUBR=	viewvc
USE_PYTHON=	2
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
