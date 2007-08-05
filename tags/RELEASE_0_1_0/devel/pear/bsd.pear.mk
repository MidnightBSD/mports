# $FreeBSD: ports/devel/pear/bsd.pear.mk,v 1.6 2006/05/04 21:40:59 edwin Exp $

# Common code for pear- ports.

MASTER_SITES=	http://pear.php.net/get/
PKGNAMEPREFIX=	pear-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PEAR

RUN_DEPENDS+=	pear:${PORTSDIR}/devel/pear

.if !defined(USE_PHPIZE)
NO_BUILD=	yes
.endif

.if exists(${LOCALBASE}/bin/php-config)
PHP_BASE!=	${LOCALBASE}/bin/php-config --prefix
.else
PHP_BASE=	${LOCALBASE}
.endif
LPEARDIR=	share/pear
LPKGREGDIR=	${LPEARDIR}/packages/${PKGNAME}
LDATADIR=	${LPEARDIR}/data/${PORTNAME}
LDOCSDIR=	share/doc/pear/${PORTNAME}
LEXAMPLESDIR=	share/examples/pear/${PORTNAME}
LSQLSDIR=	${LPEARDIR}/sql/${PORTNAME}
LSCRIPTSDIR=	bin
LTESTSDIR=	${LPEARDIR}/tests/${PORTNAME}
PEARDIR=	${PHP_BASE}/${LPEARDIR}
PKGREGDIR=	${PHP_BASE}/${LPKGREGDIR}
DATADIR=	${PHP_BASE}/${LDATADIR}
DOCSDIR=	${PHP_BASE}/${LDOCSDIR}
EXAMPLESDIR=	${PHP_BASE}/${LEXAMPLESDIR}
SQLSDIR=	${PHP_BASE}/${LSQLSDIR}
SCRIPTFILESDIR=	${LOCALBASE}/bin
TESTSDIR=	${PHP_BASE}/${LTESTSDIR}
.if defined(CATEGORY) && !empty(CATEGORY)
LINSTDIR=	${LPEARDIR}/${CATEGORY}
.else
LINSTDIR=	${LPEARDIR}
.endif
INSTDIR=	${PHP_BASE}/${LINSTDIR}

.if !defined(USE_PHPIZE) && !exists(${.CURDIR}/pkg-plist)
PLIST=		${WRKDIR}/PLIST
.endif
PLIST_SUB=	PEARDIR=${LPEARDIR} PKGREGDIR=${LPKGREGDIR} \
		TESTSDIR=${LTESTSDIR} INSTDIR=${LINSTDIR} SQLSDIR=${LSQLSDIR} \
		SCRIPTFILESDIR=${LCRIPTSDIR}

PKGINSTALL=	${PORTSDIR}/devel/pear/pear-install
PKGDEINSTALL=	${PORTSDIR}/devel/pear/pear-deinstall

FILES?=
DATA?=
DOCS?=
EXAMPLES?=
SQLS?=
SCRIPTFILES?=
TESTS?=
_DATADIR?=	data
_DOCSDIR?=	docs
_EXAMPLESDIR?=	examples
_SQLSDIR?=	sql
_TESTSDIR?=	tests

# this is an easy way to eliminate duplicate entries in a variable :)
# if someone knows how to achieve the result without this terrible
# hack, please tell me!
.for v in FILES DOCS TESTS EXAMPLES SQLS SCRIPTFILES DATA
X${v}DIRS=	${${v}:M*/*:C;/[^/]+$;;}
. for XD in ${X${v}DIRS}
ALREADYTHERE=	0
.  for D in ${${v}DIRS}
DD=	${D}
.   if ${DD} == ${XD}
ALREADYTHERE=	1
.   endif
.  endfor
.  if ${ALREADYTHERE} == 0
${v}DIRS+=		${XD}
.  endif
. endfor
.endfor

pre-install:
.if exists(${LOCALBASE}/lib/php.DIST_PHP)	\
	|| exists(${PHP_BASE}/lib/php.DIST_PHP)	\
	|| exists(${LOCALBASE}/.PEAR.pkg)	\
	|| exists(${PHP_BASE}/.PEAR.pkg)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "	Sorry, the PEAR structure has been modified;"
	@${ECHO_MSG} "	Please deinstall your installed pear- ports."
	@${ECHO_MSG} ""
	@${FALSE}
.endif

DIRFILTER=	${SED} -En '\:^.*/[^/]*$$:s:^(.+)/[^/]*$$:\1:p' | ${SORT} -ru

.if !defined(USE_PHPIZE)
do-generate-plist:
. if !exists(${.CURDIR}/pkg-plist)
	@${ECHO_MSG} "===>   Generating packing list"; \
	(for file in ${FILES}; do echo "${LINSTDIR}/$${file}"; done; \
	for file in ${TESTS}; do echo "${LTESTSDIR}/$${file}"; done; \
	for file in ${DATA}; do echo "${LDATADIR}/$${file}"; done; \
	for file in ${SQLS}; do echo "${LSQLSDIR}/$${file}"; done; \
	for file in ${SCRIPTFILES}; do echo "${LSCRIPTSDIR}/$${file}"; done; \
	for file in ${DOCS}; do echo "%%PORTDOCS%%${LDOCSDIR}/$${file}"; done; \
	for file in ${EXAMPLES}; do echo "%%PORTDOCS%%${LEXAMPLESDIR}/$${file}"; done; \
	echo "${LPKGREGDIR}/package.xml"; \
	for d in ${FILES} ${FILES:H}; do echo $${d}; done | ${DIRFILTER} | \
	    while read dir; do echo "@dirrm ${LINSTDIR}/$${dir}"; done; \
	for d in ${TESTS}; do echo $${d}; done | ${DIRFILTER} | \
	    while read dir; do echo "@dirrm ${LTESTSDIR}/$${dir}"; done; \
	for d in ${DATA}; do echo $${d}; done | ${DIRFILTER} | \
	    while read dir; do echo "@dirrm ${LDATADIR}/$${dir}"; done; \
	for d in ${SQLS}; do echo $${d}; done | ${DIRFILTER} | \
	    while read dir; do echo "@dirrm ${LSQLSDIR}/$${dir}"; done; \
	for d in ${DOCS}; do echo $${d}; done | ${DIRFILTER} | \
	    while read dir; do echo "%%PORTDOCS%%@dirrm ${LDOCSDIR}/$${dir}"; done; \
	for d in ${EXAMPLES}; do echo $${d}; done | ${DIRFILTER} | \
	    while read dir; do echo "%%PORTDOCS%%@dirrm ${LEXAMPLESDIR}/$${dir}"; done; \
	if [ -n "${TESTS}" ]; then echo "@dirrm ${LTESTSDIR}"; fi; \
	if [ -n "${DATA}" ]; then echo "@dirrm ${LDATADIR}"; fi; \
	if [ -n "${SQLS}" ]; then echo "@dirrm ${LSQLSDIR}"; fi; \
	if [ -n "${DOCS}" ]; then echo "%%PORTDOCS%%@dirrm ${LDOCSDIR}"; fi; \
	if [ -n "${EXAMPLES}" ]; then echo "%%PORTDOCS%%@dirrm ${LEXAMPLESDIR}"; fi; \
	echo "@dirrm ${LPKGREGDIR}"; \
	if [ -n "${CATEGORY}" ]; then echo "@dirrmtry ${LINSTDIR}"; fi; \
	if [ -n "${CATEGORY:M*/*}" ]; then echo "@dirrmtry ${LINSTDIR:H}"; fi; \
	echo "@dirrmtry ${LPKGREGDIR:H}"; \
	echo "@dirrmtry ${LDOCSDIR:H}"; \
	echo "@dirrmtry ${LEXAMPLESDIR:H}"; \
	echo "@dirrmtry ${LTESTSDIR:H}"; \
	echo "@dirrmtry ${LDATADIR:H}"; \
	echo "@dirrmtry ${LSQLSDIR:H}") > ${PLIST}
. endif

. for t in files docs tests sqls scriptfiles examples data
.  if !target(do-install-${t}-msg)
do-install-${t}-msg: .USE
.  endif
. endfor

pre-install: 	do-generate-plist
do-install: 	do-install-files do-install-docs do-install-tests do-install-sqls \
		do-install-scriptfiles do-install-examples do-install-data

do-install-files: do-install-files-msg
	@${MKDIR} ${INSTDIR}
. for dir in ${FILESDIRS}
	@${MKDIR} ${INSTDIR}/${dir}
. endfor
. for file in ${FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${INSTDIR}/${file}
. endfor

do-install-docs: do-install-docs-msg
. if !defined(NOPORTDOCS) && !empty(DOCS)
	@${ECHO_MSG} "===> Installing documentation in ${DOCSDIR}."
	@${MKDIR} ${DOCSDIR}
.  for dir in ${DOCSDIRS}
	@${MKDIR} ${DOCSDIR}/${dir}
.  endfor
.  for file in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${_DOCSDIR}/${file} ${DOCSDIR}/${file}
.  endfor
. endif

do-install-tests: do-install-tests-msg
. if !empty(TESTS)
	@${ECHO_MSG} "===> Installing tests in ${TESTSDIR}."
	@${MKDIR} ${TESTSDIR}
.  for dir in ${TESTSDIRS}
	@${MKDIR} ${TESTSDIR}/${dir}
.  endfor
.  for file in ${TESTS}
	@${INSTALL_DATA} ${WRKSRC}/${_TESTSDIR}/${file} ${TESTSDIR}/${file}
.  endfor
. endif

do-install-data: do-install-data-msg
. if !empty(DATA)
	@${ECHO_MSG} "===> Installing data in ${DATADIR}."
	@${MKDIR} ${DATADIR}
.  for dir in ${DATADIRS}
	@${MKDIR} ${DATADIR}/${dir}
.  endfor
.  for file in ${DATA}
	@${INSTALL_DATA} ${WRKSRC}/${_DATADIR}/${file} ${DATADIR}/${file}
.  endfor
. endif

do-install-sqls: do-install-sqls-msg
. if !empty(SQLS)
	@${ECHO_MSG} "===> Installing sqls in ${SQLSDIR}."
	@${MKDIR} ${SQLSDIR}
.  for dir in ${SQLSDIRS}
	@${MKDIR} ${SQLSDIR}/${dir}
.  endfor
.  for file in ${SQLS}
	@${INSTALL_DATA} ${WRKSRC}/${_SQLSDIR}/${file} ${SQLSDIR}/${file}
.  endfor
. endif

do-install-scriptfiles: do-install-scriptfiles-msg
. if !empty(SCRIPTFILES)
	@${ECHO_MSG} "===> Installing scripts in ${SCRIPTFILESDIR}."
.  for file in ${SCRIPTFILES}
	@${CP} ${WRKSRC}/pear-${file} ${WRKSRC}/${file}
	@${REINPLACE_CMD} -e "s|@php_bin@|${SCRIPTFILESDIR}/php|g" ${WRKSRC}/${file}
	@${REINPLACE_CMD} -e "s|@php_dir@|${PREFIX}/lib/php|g" ${WRKSRC}/${file}
	@${REINPLACE_CMD} -e "s|@include_path@|${PREFIX}/${LPEARDIR}|g" ${WRKSRC}/${file}
	@${INSTALL_SCRIPT} ${WRKSRC}/${file} ${SCRIPTFILESDIR}/${file}
.  endfor
. endif

do-install-examples: do-install-examples-msg
. if !defined(NOPORTDOCS) && !empty(EXAMPLES)
	@${ECHO_MSG} "===> Installing examples in ${EXAMPLESDIR}."
	@${MKDIR} ${EXAMPLESDIR}
.  for dir in ${EXAMPLESDIRS}
	@${MKDIR} ${EXAMPLESDIR}/${dir}
.  endfor
.  for file in ${EXAMPLES}
	@${INSTALL_DATA} ${WRKSRC}/${_EXAMPLESDIR}/${file} ${EXAMPLESDIR}/${file}
.  endfor
. endif
.endif

post-install:
	@${MKDIR} ${PKGREGDIR}
	@${INSTALL_DATA} ${WRKDIR}/package.xml ${PKGREGDIR}
	@${SETENV} PKG_PREFIX=${PREFIX} \
	${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
