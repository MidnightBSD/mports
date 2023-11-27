PORTNAME=	couchdb3
DISTVERSION=	3.2.2
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	APACHE/couchdb/source/${DISTVERSION}
DISTNAME=	apache-couchdb-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON document database with HTTP API and scalable multi-master sync
WWW=		https://couchdb.apache.org/

LICENSE=	apache2 bsd3 iscl WTFPL OFL11
LICENSE_COMB=	multi

BUILD_DEPENDS=	rebar:devel/rebar \
		erlang-runtime24>=24.0:lang/erlang-runtime24
LIB_DEPENDS=	libicudata.so:devel/icu \
		libmozjs-91.so:lang/spidermonkey91
RUN_DEPENDS=	erlang-runtime24>=24.0:lang/erlang-runtime24

USES=		compiler:c++17-lang cpe gmake libtool ncurses
USE_RC_SUBR=	${PORTNAME}

CONFLICTS=	couchdb[24]*

CPE_VENDOR=	apache
CPE_PRODUCT=	couchdb

USERS=		couchdb
GROUPS=		couchdb

SUB_FILES=	pkg-message
SUB_LIST=	APPDIR=${APPDIR} \
		ERL_PATH=${LOCALBASE}/lib/erlang22/bin/erl \
		PORTNAME=${PORTNAME} \
		RELDIR=${RELDIR} \
		WWWDIR=${WWWDIR}
PLIST_SUB=	VERSION=${DISTVERSION}

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--skip-deps --user ${USERS} --rebar ${LOCALBASE}/bin/rebar \
		--spidermonkey-version 91

ALL_TARGET=	release

MAKE_ENV=	PATH=${LOCALBASE}/lib/erlang22/bin:${PATH}

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

DBDIR?=		/var/db/${PORTNAME}
LOGDIR?=	/var/log/${PORTNAME}
LOGFILE?=	${LOGDIR}/couch.log
APPDIR=		${LOCALBASE}/libexec/${PORTNAME}
RELDIR=		${APPDIR}/releases/${DISTVERSION}

NO_TEST=	yes

.include <bsd.mport.options.mk>

.if ${ARCH} == i386
EXTRA_PATCHES=	${PATCHDIR}/extra-patch-src_jiffy_c__src_double-conversion_strtod.cc
.endif

post-patch:
	@${REINPLACE_CMD} \
	    -e 's,%%APPDIR%%,${APPDIR},g' \
	    -e 's,%%DATADIR%%,${DATADIR},g' \
	    -e 's,%%DBDIR%%,${DBDIR},g' \
	    -e 's,%%LOCALBASE%%,${LOCALBASE},g' \
	    -e 's,%%PORTNAME%%,${PORTNAME},g' \
	    -e 's,%%WWWDIR%%,${WWWDIR},g' \
	    -e 's,$$COUCHDB_USER,${USERS},g' \
	    -e 's,$$LOG_FILE,${LOGFILE},g' \
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
		${STAGEDIR}${MANPREFIX}/man/man1
	# prune build artefacts and surplus headers
	${FIND} -E ${WRKSRC} -type f \
		-regex '.*\.(a|buildinfo|c|cc|cmd|d|o|orig|h|cpp)' -print -delete
	# remove runtime dirs and files that were moved to match hier(7)
	${RM} -rv ${WRKSRC}/rel/couchdb/var \
		${WRKSRC}/rel/couchdb/etc/*.d \
		${WRKSRC}/rel/couchdb/etc/local.ini \
		${WRKSRC}/rel/couchdb/etc/vm.args \
		${WRKSRC}/rel/couchdb/releases/*/vm.args \
		${WRKSRC}/rel/couchdb/lib/couch-*/priv/couch*js
	@${CP} ${WRKSRC}/src/docs/images/favicon.ico ${WRKSRC}/share/www/
	(cd ${WRKSRC}/rel/couchdb && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${APPDIR})

post-install:
	@${FIND} -E ${FAKE_DESTDIR} -type f \
		\( -name couchjs -o -name *.so \) \
		-exec ${STRIP_CMD} {} +
	@${MKDIR} \
		${FAKE_DESTDIR}${DBDIR} \
		${FAKE_DESTDIR}${LOGDIR}
	# fauxton UI is a required component
	(cd ${WRKSRC}/share/www && ${COPYTREE_SHARE} . ${WWWDIR})

post-install-DOCS-on:
	(cd ${WRKSRC}/share/docs/html && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${WWWDIR}/docs)

.include <bsd.port.mk>
