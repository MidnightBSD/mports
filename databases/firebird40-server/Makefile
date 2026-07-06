PORTNAME=	firebird
PORTVERSION=	4.0.4
PORTREVISION=	1
CATEGORIES?=	databases
MASTER_SITES=	https://github.com/FirebirdSQL/${PORTNAME}/releases/download/v${PORTVERSION}/
PKGNAMESUFFIX?=	${PORTVERSION:R:S/.//}-server
DISTNAME=	${PORTNAME:S/f/F/}-${PORTVERSION}.3010-0
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Firebird-4 relational database (server)
WWW=		https://www.firebirdsql.org/

LICENSE=	IDPL IPL
LICENSE_COMB=	multi
LICENSE_NAME_IDPL=	Initial Developer's Public License
LICENSE_NAME_IPL=	InterBase Public License
LICENSE_FILE_IDPL=	${WRKSRC}/builds/install/misc/IDPLicense.txt
LICENSE_FILE_IPL=	${WRKSRC}/builds/install/misc/IPLicense.txt
LICENSE_PERMS_IDPL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_IPL=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

LIB_DEPENDS=	libicuuc.so:devel/icu \
		libtommath.so:math/libtommath \
		libtomcrypt.so:security/libtomcrypt

CONFLICTS_INSTALL=	firebird30

USES=		cpe gmake iconv pkgconfig localbase:ldflags libedit tar:xz
USE_CXXSTD=	c++17
GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes
CPE_VENDOR=	firebirdsql

CONFIGURE_ARGS=	--prefix=${LOCALSTATEDIR} \
		--exec-prefix=${PREFIX} \
		--with-fbbin=${PREFIX}/bin \
		--with-fblib=${PREFIX}/lib \
		--with-fbconf=${PREFIX}/${CONFDIR} \
		--with-fbglock=${LOCALSTATEDIR} \
		--with-fbhelp=${LOCALSTATEDIR}/help \
		--with-fbintl=${LIBEXECDIR}/intl \
		--with-fblog=${LOCALSTATEDIR} \
		--with-fbmsg=${DATADIR} \
		--with-fbplugins=${LIBEXECDIR}/plugins \
		--with-fbtzdata=${LIBEXECDIR}/tzdata \
		--with-fbsbin=${PREFIX}/sbin \
		--with-fbsecure-db=${LOCALSTATEDIR} \
		--with-fbsample-db=${EXAMPLESDIR}

CONFIGURE_ENV+=	PTHREAD_LIBS="-lpthread" \
		ac_cv_header_atomic_ops_h="no" \
		ac_cv_lib_atomic_ops_main="no"

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd13.4

LOCALSTATEDIR=	/var/db/firebird
CONFDIR=	etc/firebird
LIBEXECDIR=	${PREFIX}/libexec/firebird
PLIST_SUB=	FIREBIRD_VERSION=${PORTVERSION} \
		LOCALSTATEDIR="var/db/firebird" CONFDIR="${CONFDIR}"

# Don't use ld for linking, use gcc
LD=	${CC}

# Don't strip binary files
STRIP=

ONLY_FOR_ARCHS=	i386 amd64 powerpc64le

INSTALL_FB=	${INSTALL} ${COPY}

.if !defined(CLIENT_ONLY)
# Server part stuff
USES+=		firebird:4.0

CONFIGURE_ARGS+=--without-editline

USE_RC_SUBR=	firebird
SUB_FILES=	pkg-message

UTIL_SBIN=	fbguard firebird
UTIL_BIN=	fb_lock_print fbsplit fbstat fbsvcmgr fbtracemgr gbak gfix gsec \
		nbackup
UDR_SO=		libudf_compat.so
UDR_SQL=	udf_compat.sql
PLUGIN_SO=	libChaCha.so libEngine13.so libfbtrace.so libLegacy_Auth.so \
		libLegacy_UserManager.so libSrp.so libudr_engine.so
TZDATA_FILES=	ids.dat timezoneTypes.res windowsZones.res zoneinfo64.res \
		metaZones.res

PKGINSTALL?=	${PKGDIR}/pkg-install-server
.else
# Client part stuff
USES+=		libedit

CONFIGURE_ARGS+=	--with-system-editline
CONFIGURE_ENV+=	ac_cv_lib_edit_readline="yes"

USE_LDCONFIG=	yes
CLIENT_BIN=	gpre isql-fb
CLIENT_HEADER=	extlib/ib_util.h include/ibase.h include/iberror.h yvalve/perf.h

OPTIONS_DEFINE=	DOCS

DOCS_PORTDOCS=	*

FB_DOCS_FILES=	README.* Firebird* ambiguity.txt \
		ods11-index-structure.html
FB_DOCS_DIRS=	sql.extensions license upgrade
.endif

MAKE_ENV+=	FIREBIRD_TMP="${WRKDIR}" FIREBIRD_LOCK="${WRKDIR}"
#MAKE_ARGS+=	PREFIX="${PREFIX}"

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=	-DAMD64
.endif

.if !defined(CLIENT_ONLY)
USERS=	${PORTNAME}
GROUPS=	${USERS}

MAKE_ENV+=	IsServer=Y
.endif

post-patch:
	${FIND} ${WRKSRC} -name "*.sh" -exec ${CHMOD} +x {} \+
	${FIND} ${WRKSRC}/src/include/firebird -name "*.orig" -exec ${RM} {} +
	${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' \
		${WRKSRC}/builds/install/misc/firebird.conf

pre-build:
.if !defined(CLIENT_ONLY)
	@${SETENV} PKG_PREFIX="${FAKE_DESTDIR}${TRUE_PREFIX}" ${SH} ${PKGINSTALL} ${PORTNAME} PRE-INSTALL
.endif
	${MAKE} -C ${WRKSRC}/extern/btyacc

do-install:
.if !defined(CLIENT_ONLY)
	${INSTALL_PROGRAM} ${UTIL_BIN:S!^!${WRKSRC}/gen/Release/firebird/bin/!} ${PREFIX}/bin
	${INSTALL_PROGRAM} ${UTIL_SBIN:S!^!${WRKSRC}/gen/Release/firebird/bin/!} ${PREFIX}/sbin

	@${MKDIR} ${PREFIX}/${CONFDIR}
	${INSTALL_DATA} ${WRKSRC}/gen/Release/firebird/databases.conf ${PREFIX}/${CONFDIR}/databases.conf.sample
	${INSTALL_DATA} ${WRKSRC}/gen/Release/firebird/fbtrace.conf ${PREFIX}/${CONFDIR}/fbtrace.conf
	${INSTALL_DATA} ${WRKSRC}/gen/Release/firebird/replication.conf ${PREFIX}/${CONFDIR}/replication.conf.sample
	${INSTALL_DATA} ${WRKSRC}/gen/Release/firebird/plugins.conf ${PREFIX}/${CONFDIR}/plugins.conf.sample
	${INSTALL_DATA} ${WRKSRC}/gen/Release/firebird/plugins/udr_engine.conf ${PREFIX}/${CONFDIR}/udr_engine.conf.sample

	${MKDIR} ${LIBEXECDIR}/plugins/udr ${FAKE_DESTDIR}${LOCALSTATEDIR}/help ${LIBEXECDIR}/intl \
		${LIBEXECDIR}/tzdata ${EXAMPLESDIR}

	${INSTALL_DATA} ${WRKSRC}/gen/Release/firebird/lib/libib_util.so ${PREFIX}/lib

	${INSTALL_DATA} ${WRKSRC}/gen/Release/firebird/intl/fbintl.conf ${LIBEXECDIR}/intl/fbintl.conf
	${INSTALL_FB} -m 0555 ${UDR_SO:S!^!${WRKSRC}/gen/Release/firebird/plugins/udr/!} ${LIBEXECDIR}/plugins/udr
	${INSTALL_FB} -m 0444 ${UDR_SQL:S!^!${WRKSRC}/gen/Release/firebird/plugins/udr/!} ${LIBEXECDIR}/plugins/udr
	${INSTALL_FB} -m 0555 ${PLUGIN_SO:S!^!${WRKSRC}/gen/Release/firebird/plugins/!} ${LIBEXECDIR}/plugins
	${INSTALL_FB} -m 0444 ${TZDATA_FILES:S!^!${WRKSRC}/gen/Release/firebird/tzdata/!} ${LIBEXECDIR}/tzdata

	${INSTALL_FB} -m 0660 ${WRKSRC}/gen/Release/firebird/security4.fdb ${FAKE_DESTDIR}${LOCALSTATEDIR}/security4.fdb.sample
	${INSTALL_FB} -m 0660 ${WRKSRC}/gen/Release/firebird/examples/empbuild/employee.fdb ${EXAMPLESDIR}/employee.fdb
	${INSTALL_FB} -m 0660 ${WRKSRC}/gen/Release/firebird/examples/empbuild/employe2.sql ${EXAMPLESDIR}/employe2.sql

	${INSTALL_FB} -m 0440 ${WRKSRC}/gen/Release/firebird/help/help.fdb ${FAKE_DESTDIR}${LOCALSTATEDIR}/help

	${INSTALL_FB} -m 0555 ${WRKSRC}/gen/Release/firebird/intl/libfbintl.so ${LIBEXECDIR}/intl/libfbintl.so
.else
# defined CLIENT_ONLY
	${INSTALL_PROGRAM} ${CLIENT_BIN:S!^!${WRKSRC}/gen/Release/firebird/bin/!} ${PREFIX}/bin

	${SED} -e "s=%%PREFIX%%=${PREFIX}=g" ${WRKSRC}/gen/Release/firebird/firebird.conf > ${WRKDIR}/firebird.conf

	@${MKDIR} ${PREFIX}/${CONFDIR}
	${INSTALL_DATA} ${WRKDIR}/firebird.conf ${PREFIX}/${CONFDIR}/firebird.conf.sample

	${INSTALL_DATA} ${WRKSRC}/gen/Release/firebird/lib/libfbclient.so.${PORTVERSION} \
		${PREFIX}/lib

	${LN} -fs libfbclient.so.${PORTVERSION} ${PREFIX}/lib/libfbclient.so.4
	${LN} -fs libfbclient.so.${PORTVERSION} ${PREFIX}/lib/libfbclient.so

	@${MKDIR} ${PREFIX}/include/firebird
	${INSTALL_DATA} ${CLIENT_HEADER:S!^!${WRKSRC}/src/!} ${PREFIX}/include

	@cd ${WRKSRC}/src/include/firebird && \
		${FIND} * -type d -exec ${MKDIR} "${PREFIX}/include/firebird/{}" \;

	@cd ${WRKSRC}/src/include/firebird && \
		${FIND} * -type f -exec ${INSTALL_DATA} "{}" "${PREFIX}/include/firebird/{}" \;

	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/gen/Release/firebird/*.msg ${DATADIR}

post-install-DOCS-on:
	@${ECHO_MSG} "===>   Installing documentation for ${PKGNAME}"
	@${MKDIR} ${FB_DOCS_DIRS:S!^!${FAKE_DESTDIR}${DOCSDIR}/!}
	${INSTALL_DATA} ${FB_DOCS_FILES:S!^!${WRKSRC}/doc/!} ${FAKE_DESTDIR}${DOCSDIR}
	${LN} -sf README.user ${FAKE_DESTDIR}${DOCSDIR}/README
	${INSTALL_DATA} ${WRKSRC}/doc/sql.extensions/* ${FAKE_DESTDIR}${DOCSDIR}/sql.extensions
	${INSTALL_DATA} ${WRKSRC}/doc/license/* ${FAKE_DESTDIR}${DOCSDIR}/license
	${INSTALL_DATA} ${WRKSRC}/src/misc/upgrade/v3.0/* ${FAKE_DESTDIR}${DOCSDIR}/upgrade
.endif

.include <bsd.port.post.mk>
