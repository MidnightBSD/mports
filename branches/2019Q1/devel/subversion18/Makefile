# $MidnightBSD$

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Version control system

LICENSE=	apache2

USE_RC_SUBR=	svnserve

PORTDOCS=	BUGS CHANGES COMMITTERS INSTALL README

OPTIONS_DEFINE=	\
		BDB		\
		DOCS		\
		GNOME_KEYRING	\
		MAINTAINER_DEBUG\
		MOD_DAV_SVN	\
		NLS		\
		P4_STYLE_MARKERS\
		SASL		\
		SERF		\
		STATIC		\
		SVNSERVE_WRAPPER\
		TEST		\
		TOOLS

OPTIONS_DEFAULT=P4_STYLE_MARKERS \
		SERF

GNOME_KEYRING_DESC=	Build with GNOME Keyring auth support
MAINTAINER_DEBUG_DESC=	Build debug version
MOD_DAV_SVN_DESC=	mod_dav_svn module for Apache 2.X
P4_STYLE_MARKERS_DESC=	Perforce-style conflict markers
SERF_DESC=		WebDAV/Delta-V (HTTP/HTTPS) repo access module
STATIC_DESC=		Build static version (no shared libs)
SVNSERVE_WRAPPER_DESC=	Enable svnserve wrapper (umask setter)
TEST_DESC=		Run subversion test suite
TOOLS_DESC=		Install several tools

.include "Makefile.common"

EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

SVNREPOS?=	/home/svn/repos
SVNFSTYPE?=	fsfs

SUB_FILES=	pkg-install \
		pkg-deinstall
SUB_LIST+=	SED=${SED}
		
.if make(repository)
WITH_REPOSITORY_CREATION=	yes
.endif

.if defined(WITH_REPOSITORY_CREATION)
MKREPOS_TARGET=	_mkrepos
.endif

# Patches required for use with the FreeBSD Project repository only
.if ${PORT_OPTIONS:MP4_STYLE_MARKERS}
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-3way-conflict-markers
.endif

.if empty(PORT_OPTIONS:MMAINTAINER_DEBUG)
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-Makefile.in
.endif

.if ${PORT_OPTIONS:MSVNSERVE_WRAPPER}
PLIST_SUB+=	SVNSERVE_WRAPPER=""
SUB_LIST+=	SVNSERVE_BIN_EXT=".bin"
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-svnserve-wrapper
.else
PLIST_SUB+=	SVNSERVE_WRAPPER="@comment "
SUB_LIST+=	SVNSERVE_BIN_EXT=""
.endif

.if ${PORT_OPTIONS:MTOOLS}
PLIST_SUB+=	TOOLS=""
.else
PLIST_SUB+=	TOOLS="@comment "
.endif

.if ${PORT_OPTIONS:MTEST}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3
.endif

SCRIPTS=

SCRIPTS_DATA=

# until nls is fixed
PLIST_SUB+=	NLS="@comment "

.if ${PORT_OPTIONS:MSTATIC}
.  if ${PORT_OPTIONS:MNLS}
USES+=		gettext:build
.  endif
.  if ${PORT_OPTIONS:MBDB}
BDB_BUILD_DEPENDS=	yes
.  endif
OLD_LIB_DEPENDS:=	${LIB_DEPENDS:S!^!${LOCALBASE}/lib/!:C!(\.so|\.[0-9]+)?:!.a:!}
BUILD_DEPENDS+=		${OLD_LIB_DEPENDS}
LIB_DEPENDS=
.endif

TOOLS_STATIC_BINARIES=	client-side/svn-bench/svn-bench server-side/svnauthz \
			server-side/fsfs-stats \
			server-side/svn-populate-node-origins-index \
			server-side/svnauthz-validate \
			server-side/svn-rep-sharing-stats dev/fsfs-reorg \
			dev/svnraisetreeconflict/svnraisetreeconflict \
			dev/fsfs-access-map diff/diff3 diff/diff diff/diff4

pre-everything::
	@${ECHO_MSG} ""
.if ${PORT_OPTIONS:MBDB}
	@${ECHO_MSG} "Berkeley DB (4 or 5) repository backend enabled."
.else
	@${ECHO_MSG} "Berkeley DB (4 or 5) repository backend disabled."
.endif
	@${ECHO_MSG} ""
.if ${PORT_OPTIONS:MMAINTAINER_DEBUG}
	@${ECHO_MSG} "Build debug version."
	@${ECHO_MSG} ""
.endif
.if ${PORT_OPTIONS:MTOOLS}
	@${ECHO_MSG} "Several tools enabled."
.else
	@${ECHO_MSG} "You can enable installation fo tools"
.endif
	@${ECHO_MSG} ""
.if ${PORT_OPTIONS:MMOD_DAV_SVN}
	@${ECHO_MSG} "mod_dav_svn module for Apache 2.X enabled."
.else
	@${ECHO_MSG} "You can enable the mod_dav_svn module for Apache 2.X"
.endif
	@${ECHO_MSG} ""
.if ${PORT_OPTIONS:MTOOLS} && ${PORT_OPTIONS:MMOD_DAV_SVN}
	@${ECHO_MSG} "mod_dontdothat module for Apache 2.X enabled."
.else
	@${ECHO_MSG} "You can enable the mod_dontdothat module for Apache 2.X"
.endif
	@${ECHO_MSG} ""
.if ${PORT_OPTIONS:MSVNSERVE_WRAPPER}
	@${ECHO_MSG} "svnserve wrapper enabled."
	@${ECHO_MSG} ""
.endif
.if defined(WITH_REPOSITORY_CREATION)
	@${ECHO_MSG} "I will create (or use, if it exists) '${SVNUSER}' user and '${SVNGROUP}' group."
	@${ECHO_MSG} "Make sure that all committers are its members."
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Repository will be created at '${SVNREPOS}' with user '${SVNUSER}' and group '${SVNGROUP}'."
	@${ECHO_MSG} "Type of repository will be '${SVNFSTYPE}'."
	@${ECHO_MSG} "You could change these settings by defining SVNREPOS, SVNGROUP and SVNFSTYPE."
.else
	@${ECHO_MSG} "You can have the repository created for you by defining"
	@${ECHO_MSG} "WITH_REPOSITORY_CREATION."
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Make sure that:"
	@${ECHO_MSG} "* all your svn users are members of a common group"
	@${ECHO_MSG} "* this group is the group id of the db/ and locks/"
	@${ECHO_MSG} "  subdirectories of your repository"
	@${ECHO_MSG} "* the above subdirectories are writable by this group"
.endif
	@${ECHO_MSG} ""
#.if ${PORT_OPTIONS:MASVN}
#	@${ECHO_MSG} "asvn will be installed"
#	@${ECHO_MSG} ""
#.endif
.if ${PORT_OPTIONS:MSTATIC}
.if ${PORT_OPTIONS:MMOD_DAV_SVN}
	@${ECHO_MSG} "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	@${ECHO_MSG} "!!! mod_dav_svn and static build are not compatible !!!"
	@${ECHO_MSG} "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	@${FALSE}
.endif
.if ${PORT_OPTIONS:MSVNAUTHZ_VALIDATE}
	@${ECHO_MSG} "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	@${ECHO_MSG} "!!! svnauthz_validate and static build are not compatible !!!"
	@${ECHO_MSG} "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	@${FALSE}
.endif
.if ${PORT_OPTIONS:MGNOME_KEYRING}
	@${ECHO_MSG} "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	@${ECHO_MSG} "!!! Gnome Keyring and static build are not compatible !!!"
	@${ECHO_MSG} "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	@${FALSE}
.endif
	@${ECHO_MSG} "Static binaries will be built."
.endif
	@${ECHO_MSG} "Many useful scripts will be installed into ${DATADIR}"

pre-configure:
.if ${PORT_OPTIONS:MBDB}
	@BDB_VERSION=`${APR_APU_DIR}/${APU_CONFIG} --db-version`; \
	if [ "$${BDB_VERSION}" != "4" -a "$${BDB_VERSION}" != "5" ] ; then \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} 'You should build `'"devel/apr1' with Berkeley DB (4 or 5) support to use subversion with it." ; \
		${ECHO_MSG} 'Please rebuild `'"devel/apr1' with option "'`'"${OPT_NAME}' and try again." ; \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} "Or you can disable Berkeley DB support. Only 'fs' repository backend will be available." ; \
		${ECHO_MSG} "" ; \
		${FALSE} ; \
	fi
.endif
.if ${PORT_OPTIONS:MSTATIC}
	@if grep -q icui18n /usr/lib/libsqlite3.la ; then \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} "You can not build static subversion if your SQLite3 is built with ICU enabled."; \
		${ECHO_MSG} "Please, reinstall 'devel/sqlite3' port with disabled ICU support."; \
		${ECHO_MSG} "" ; \
		${FALSE} ; \
	fi		
.endif
# this is required for msgfmt to work
	@${REINPLACE_CMD} -e 's/UTF-8\\n/UTF-8/gI' ${WRKSRC}/subversion/po/*.po

# takes a long time, and will fail but gives maintainer a good oversight
.if ${PORT_OPTIONS:MTEST}
test:
	-@make check -C ${WRKSRC}
.endif

post-install:	${MKREPOS_TARGET}
.if ${PORT_OPTIONS:MTOOLS}
	cd ${WRKSRC} && ${MAKE} ${FAKE_MAKEARGS} install-tools
.endif
	@${MKDIR} ${DATADIR}
.if ${PORT_OPTIONS:MSTATIC}
	cd ${WRKSRC}/tools ; \
	  ${RM} ${TOOLS_STATIC_BINARIES}
.endif
	cd ${WRKSRC}/tools ; \
	  ${TAR} --exclude '*.in' --exclude '.libs' --exclude '*.o' --exclude '*.lo' --exclude '*.la' --exclude='*.slo' -cf - * | ${TAR} -C ${DATADIR} -xf -
# ugly hack to remove libtool scripts ...
	@${GREP} -R ${WRKSRC} ${DATADIR} | ${CUT} -d\: -f 1 | ${XARGS} ${RM} -f
	@${CHMOD} -R a-st,o+rX ${DATADIR}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	for f in ${PORTDOCS}; do \
	  ${INSTALL_MAN} ${WRKSRC}/$$f ${DOCSDIR}; \
	done
.endif
.if ${PORT_OPTIONS:MASVN}
	${INSTALL_SCRIPT} ${WRKSRC}/contrib/client-side/asvn ${PREFIX}/bin
.endif
.if ${PORT_OPTIONS:MSVNSERVE_WRAPPER}
	@${INSTALL_SCRIPT} ${FILESDIR}/svnserve.wrapper ${PREFIX}/bin/svnserve
.endif

repository:	_mkrepos

_SVNGRPFILES=	db locks locks/db.lock locks/db-logs.lock
.if ${PORT_OPTIONS:MMOD_DAV_SVN}
_SVNGRPFILES+=	dav
.endif
SVNGRPFILES=	${_SVNGRPFILES:S,^,${SVNREPOS}/,}

_mkrepos:	.USE
.if !exists(${SVNREPOS})
.if ${PORT_OPTIONS:MSVNSERVE_WRAPPER}
	@if /usr/sbin/pw groupshow "${SVNGROUP}" >/dev/null 2>&1; then \
	    ${ECHO_MSG} "You already have a group \"${SVNGROUP}\", so I will use it."; \
	else \
	    if /usr/sbin/pw groupadd ${SVNGROUP} -h -; \
	    then \
	        ${ECHO_MSG} "Added group \"${SVNGROUP}\"."; \
	    else \
	        ${ECHO_MSG} "Adding group \"${SVNGROUP}\" failed..."; \
	        ${ECHO_MSG} "Please create it, and try again."; \
	        ${FALSE}; \
	    fi; \
	fi
	@if /usr/sbin/pw usershow "${SVNUSER}" >/dev/null 2>&1; then \
	    ${ECHO_MSG} "You already have a user \"${SVNUSER}\", so I will use it."; \
	else \
	    if /usr/sbin/pw useradd ${SVNUSER} -h -; \
	    then \
	        ${ECHO_MSG} "Added user \"${SVNUSER}\"."; \
	    else \
	        ${ECHO_MSG} "Adding user \"${SVNUSER}\" failed..."; \
	        ${ECHO_MSG} "Please create it, and try again."; \
	        ${FALSE}; \
	    fi; \
	fi
.endif
	@${MKDIR} ${SVNREPOS}
	@${PREFIX}/bin/svnadmin create --fs-type ${SVNFSTYPE} ${SVNREPOS}
.if ${PORT_OPTIONS:MSVNSERVE_WRAPPER}
.if ${PORT_OPTIONS:MMOD_DAV_SVN}
	@${MKDIR} ${SVNREPOS}/dav
.endif
	@${CHOWN} ${SVNUSER}:${SVNGROUP} ${SVNGRPFILES}
	@${CHMOD} g+w ${SVNGRPFILES}
	@for i in ${SVNREPOS}/db/* ; do \
	    i=$${i##*/}; \
	    case $$i in \
	    DB_CONFIG|fs-type|uuid) ;; \
	    *) ${CHOWN} -R ${SVNUSER}:${SVNGROUP} ${SVNREPOS}/db/$$i; \
	       ${CHMOD} -R g+w ${SVNREPOS}/db/$$i; \
	       ;; \
	    esac; \
	done
.endif
.endif

svn-build-outputs-hack:
	cd ${WRKSRC} && ./gen-make.py --release --installed-libs libsvn_client,libsvn_delta,libsvn_diff,libsvn_fs,libsvn_ra,libsvn_repos,libsvn_subr,libsvn_wc
	${MV} ${WRKSRC}/build-outputs.mk ${FILESDIR}/build-outputs.mk

.include <bsd.port.post.mk>
