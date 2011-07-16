# $MidnightBSD: mports/devel/viewvc/Makefile,v 1.14 2010/12/08 23:58:10 laffer1 Exp $

PORTNAME=	viewvc
PORTVERSION=	1.1.10
CATEGORIES=	devel python
MASTER_SITES=	http://www.viewvc.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web-based Version Control Repository Browsing
LICENSE=	bsd2

OPTIONS=\
		SUBVERSION 	"use svn binding" 						on \
		APACHE 		"use ${APACHE_PORT} as webserver"		on \
		LIGHTTPD 	"use Lighttp as webserver" 				off \
		MYSQL 		"enable experimental MYSQL support" 	off

NO_BUILD=	yes
USE_PYTHON=	yes
SUB_FILES=	pkg-message
SUB_LIST=	INSTDIR="${PREFIX}/${INSTDIR}" \
		PYTHON_CMD=${PYTHON_CMD} \
		ECHO=${ECHO} EGREP=${EGREP} TOUCH=${TOUCH} \
		CHOWN=${CHOWN} RM=${RM}

INSTDIR?=	${PORTNAME}
PLIST_SUB=	INSTDIR=${INSTDIR}

.include <bsd.mport.options.mk>

.if !defined(WITH_APACHE) && !defined(WITH_LIGHTTPD)
USE_RC_SUBR=	viewvc
.endif

RUN_DEPENDS+=	${LOCALBASE}/bin/pygmentize:${PORTSDIR}/textproc/py-pygments

# viewvc can support CVS or SVN, controlled with the parameter
# cvs_roots (for CVS), svn_roots (for Subversion) in viewvc.conf
.if defined (WITH_SUBVERSION)
RUN_DEPENDS+=	${PYTHON_LIBDIR}/site-packages/svn/__init__.py:${PORTSDIR}/devel/py-subversion
.endif

.if defined (WITH_APACHE)
USE_APACHE=	2.2+
.endif

.if defined(WITH_LIGHTTPD)
RUN_DEPENDS+=	lighttpd:${PORTSDIR}/www/lighttpd
.endif

# This feature is a clone of the Mozilla Project's Bonsai database.
# It catalogs every commit in the CVS or Subversion repository into a SQL database.
# In fact, the databases are 100% compatible.
.if defined(WITH_MYSQL)
RUN_DEPENDS+=	${PYTHON_LIBDIR}/site-packages/_mysql.so:${PORTSDIR}/databases/py-MySQLdb
.endif

pre-everything::
.if defined(WITH_APACHE) && defined(WITH_LIGHTTPD)
	@${ECHO_CMD} "It doesn't make sense to depend on Apache *and* LighHTTPD choose only one."
	@${FALSE}
.endif

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
