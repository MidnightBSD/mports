PORTNAME=	couchdb3
DISTVERSION=	3.3.3
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	APACHE/couchdb/source/${DISTVERSION}
DISTNAME=	apache-couchdb-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON document database with HTTP API and scalable cluster mesh sync
WWW=		https://couchdb.apache.org/

LICENSE=	Apache-2.0 bsd3 iscl WTFPL OFL11
LICENSE_COMB=	multi

BUILD_DEPENDS=	erlang-runtime${_ERLVER}>=${_ERLVER}.0:lang/erlang-runtime${_ERLVER} \
		rebar:devel/rebar
LIB_DEPENDS=	libicudata.so:devel/icu \
		libmozjs-91.so:lang/spidermonkey91
RUN_DEPENDS=	erlang-runtime${_ERLVER}>=${_ERLVER}.0:lang/erlang-runtime${_ERLVER}

USES=		compiler:c++17-lang cpe gmake libtool ncurses
CPE_VENDOR=	apache
CPE_PRODUCT=	couchdb
USE_RC_SUBR=	${PORTNAME}

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--skip-deps \
		--user ${USERS} \
		--rebar ${LOCALBASE}/bin/rebar \
		--spidermonkey-version 91

MAKE_ENV=	PATH=${LOCALBASE}/lib/erlang${_ERLVER}/bin:${PATH}
ALL_TARGET=	release

CONFLICTS=	couchdb[24]*

SUB_FILES=	pkg-message
SUB_LIST=	APPDIR=${_APPDIR} \
		ERL_PATH=${LOCALBASE}/lib/erlang${_ERLVER}/bin/erl \
		PORTNAME=${PORTNAME} \
		RELDIR=${_RELDIR} \
		WWWDIR=${WWWDIR}

USERS=		couchdb
GROUPS=		couchdb

PLIST_SUB=	VERSION=${DISTVERSION}

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

_APPDIR=	${LOCALBASE}/libexec/${PORTNAME}
_DBDIR?=	/var/db/${PORTNAME}
_ERLVER?=	25
_LOGDIR?=	/var/log/${PORTNAME}
_LOGFILE?=	${_LOGDIR}/couch.log
_RELDIR=	${_APPDIR}/releases/${DISTVERSION}
_RUNDIR=	/var/run/${PORTNAME}

NO_TEST=	yes

.include <bsd.mport.options.mk>

.if ${ARCH} == i386
EXTRA_PATCHES=	${PATCHDIR}/extra-patch-src_jiffy_c__src_double-conversion_strtod.cc
.endif

post-patch:
	@${REINPLACE_CMD} \
	    -e 's,%%COUCHDB_USER%%,${USERS},g' \
	    -e 's,%%LOG_FILE%%,${_LOGFILE},g' \
	    -e 's,%%APPDIR%%,${_APPDIR},g' \
	    -e 's,%%DATADIR%%,${_DATADIR},g' \
	    -e 's,%%DBDIR%%,${_DBDIR},g' \
	    -e 's,%%ERLVER%%,${_ERLVER},g' \
	    -e 's,%%LOCALBASE%%,${LOCALBASE},g' \
	    -e 's,%%PORTNAME%%,${PORTNAME},g' \
	    -e 's,%%WWWDIR%%,${WWWDIR},g' \
	    ${WRKSRC}/configure
# https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=238514
.if (${OSVERSION} < 300000 || ${ARCH} == i386)
	@${REINPLACE_CMD} \
	    -e 's,$$FLTO_FLAG ,,g' \
	    ${WRKSRC}/src/jiffy/rebar.config
.endif

pre-install:
# relocate user-modifiable runtime configs to match hier(7)
	${MKDIR} ${STAGEDIR}${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/rel/couchdb/etc/local.ini \
		${STAGEDIR}${ETCDIR}/local.ini.sample
	${INSTALL_DATA} ${WRKSRC}/rel/couchdb/etc/vm.args \
		${STAGEDIR}${ETCDIR}/vm.args.sample
	${INSTALL_MAN} ${WRKSRC}/share/docs/man/apachecouchdb.1 \
		${STAGEDIR}${PREFIX}/share/man/man1
# prune build artefacts and surplus headers
	${FIND} -E ${WRKSRC} -type f \
		-regex '.*\.(a|buildinfo|c|cc|cmd|d|o|orig|h|cpp)' -print -delete
	@${CP} ${WRKSRC}/src/docs/images/favicon.ico ${WRKSRC}/share/www/
# remove runtime dirs and files that were moved to match hier(7)
	${RM} -rv \
		${WRKSRC}/rel/couchdb/etc/*.d \
		${WRKSRC}/rel/couchdb/etc/local.ini \
		${WRKSRC}/rel/couchdb/etc/vm.args \
		${WRKSRC}/rel/couchdb/lib/couch-*/priv/couch*js \
		${WRKSRC}/rel/couchdb/releases/*/vm.args \
		${WRKSRC}/rel/couchdb/share/docs \
		${WRKSRC}/rel/couchdb/share/www \
		${WRKSRC}/rel/couchdb/var
	(cd ${WRKSRC}/rel/couchdb && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${_APPDIR})

post-install:
	@${FIND} -E ${FAKE_DESTDIR} -type f \
		\( -name couchjs -o -name *.so \) \
		-exec ${STRIP_CMD} {} +
	@${MKDIR} \
		${FAKE_DESTDIR}${_DBDIR} \
		${FAKE_DESTIR}${_LOGDIR} \
		${FAKE_DESTDIR}${_RUNDIR}
# fauxton UI is a required component
	(cd ${WRKSRC}/share/www && ${COPYTREE_SHARE} . ${STAGEDIR}${WWWDIR})

post-install-DOCS-on:
	(cd ${WRKSRC}/share/docs/html && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${WWWDIR}/docs)

.include <bsd.port.mk>
