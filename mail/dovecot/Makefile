PORTNAME=	dovecot
PORTVERSION=	2.3.21.1
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	https://dovecot.org/releases/2.3/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Secure, fast and powerful IMAP and POP3 server
WWW=		https://www.dovecot.org/

LICENSE=	lgpl2.1 mit
LICENSE_COMB=	dual

FLAVORS=	default mysql pgsql
FLAVOR?=	${FLAVORS[1]}
mysql_PKGNAMESUFFIX=	-mysql
pgsql_PKGNAMESUFFIX=	-pgsql

LIB_DEPENDS=	libzstd.so:archivers/zstd

USES=		cpe iconv libtool pkgconfig ssl
USE_RC_SUBR=	dovecot

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd12.4 \
		 --host=${MACHINE_ARCH}-portbld-freebsd12.4
CONFIGURE_ARGS=	--localstatedir=/var \
		--with-docs \
		--with-ssl=openssl \
		--with-statedir=/var/db/dovecot \
		--with-shadow=no \
		--with-systemd=no

USE_LDCONFIG=	${PREFIX}/lib/dovecot
INSTALL_TARGET=	install-strip

USERS=		dovecot dovenull
GROUPS=		${USERS}

OPTIONS_DEFINE=	LIBSODIUM LIBUNWIND LIBWRAP LUA LZ4 DOCS EXAMPLES
OPTIONS_DEFAULT=GSSAPI_NONE LIBWRAP
OPTIONS_SUB=	yes

OPTIONS_GROUP=		DB FTS
OPTIONS_GROUP_DB=	CDB LDAP MYSQL PGSQL SQLITE
OPTIONS_GROUP_FTS=	ICU LUCENE SOLR TEXTCAT

OPTIONS_SINGLE=		GSSAPI
OPTIONS_SINGLE_GSSAPI=	GSSAPI_NONE GSSAPI_BASE GSSAPI_HEIMDAL GSSAPI_MIT

DB_DESC=	Database support
CDB_DESC=	CDB database support

FTS_DESC=	Full text search plugins
ICU_DESC=	Use libicu for FTS unicode normalization
LUCENE_DESC=	CLucene FTS support
SOLR_DESC=	Solr FTS support
TEXTCAT_DESC=	Libexttextcat FTS support

GSSAPI_NONE_DESC=	Build without GSSAPI support
GSSAPI_BASE_DESC=	Use GSSAPI from base
GSSAPI_HEIMDAL_DESC=	Use Heimdal GSSAPI from security/heimdal
GSSAPI_MIT_DESC=	Use MIT GSSAPI from security/krb5

# General options
LIBSODIUM_DESC=		Support libsodium based crypts (ARGON2I/ARGON2ID)
LIBSODIUM_LIB_DEPENDS=	libsodium.so:security/libsodium
LIBSODIUM_CONFIGURE_WITH=	sodium

LIBUNWIND_CONFIGURE_ON=		--with-libunwind=yes
LIBUNWIND_CONFIGURE_OFF=	--with-libunwind=no
LIBUNWIND_DESC=		Get backtraces using libunwind
LIBUNWIND_LIB_DEPENDS=	libunwind.so:devel/libunwind

LIBWRAP_CONFIGURE_WITH=	libwrap

LUA_CONFIGURE_WITH=	lua
LUA_USES=		lua:51,53

LZ4_CONFIGURE_WITH=	lz4
LZ4_LIB_DEPENDS=	liblz4.so:archivers/liblz4

# Databases
CDB_CONFIGURE_WITH=	cdb
CDB_LIB_DEPENDS=	libcdb.so:databases/tinycdb

LDAP_USES=			ldap
LDAP_CONFIGURE_WITH=		ldap
LDAP_VARS=			_REQUIRE+=slapd

MYSQL_USES=		mysql
MYSQL_CONFIGURE_WITH=	mysql
MYSQL_VARS=	_REQUIRE+=mysql

PGSQL_USES=		pgsql
PGSQL_CONFIGURE_WITH=	pgsql
PGSQL_VARS=	_REQUIRE+=postgresql

SQLITE_USES=		sqlite
SQLITE_CONFIGURE_WITH=	sqlite

# FTS
ICU_CONFIGURE_WITH=	icu
ICU_LIB_DEPENDS=	libicui18n.so:devel/icu

LUCENE_CONFIGURE_WITH=	lucene stemmer
LUCENE_LIB_DEPENDS=	libclucene-core.so:textproc/clucene

SOLR_CONFIGURE_WITH=	solr
SOLR_LIB_DEPENDS=	libcurl.so:ftp/curl \
			libexpat.so:textproc/expat2

TEXTCAT_LIB_DEPENDS=	libexttextcat-2.0.so:textproc/libexttextcat
TEXTCAT_CONFIGURE_WITH=	textcat

# GSSAPI
GSSAPI_NONE_CONFIGURE_ON=	--without-gssapi
GSSAPI_NONE_CONFIGURE_OFF=	--with-gssapi ${GSSAPI_CONFIGURE_ARGS}
GSSAPI_BASE_USES=		gssapi
GSSAPI_HEIMDAL_USES=		gssapi:heimdal
GSSAPI_MIT_USES=		gssapi:mit

DOCS=		AUTHORS COPYING INSTALL NEWS TODO README
PORTDOCS=	*
PORTEXAMPLES=	*

# Default requirement for dovecot rc script
_REQUIRE=	LOGIN

SUB_LIST+=	REQUIRE="${_REQUIRE}"
SUB_FILES+=	pkg-message

CPPFLAGS+=	-I${LOCALBASE}/include -I${OPENSSLINC}
LDFLAGS+=	-L${LOCALBASE}/lib -L${OPENSSLLIB}

post-patch:
	@${REINPLACE_CMD} -e 's,/etc/dovecot,${PREFIX}/etc/dovecot,g; \
		s,sysconfdir=/etc,sysconfdir=${PREFIX}/etc,g' \
		${WRKSRC}/doc/example-config/*.conf ${WRKSRC}/doc/example-config/conf.d/* \
		${WRKSRC}/doc/example-config/*.conf.ext
	@${REINPLACE_CMD} -e '/^LIBS =/s/$$/ @LTLIBICONV@/' \
		${WRKSRC}/src/lib-mail/Makefile.in
# Install the sample config files into ETCDIR/example-config/
	@${REINPLACE_CMD} -e '/^exampledir =/s|\$$(docdir)|${ETCDIR}|' \
		${WRKSRC}/doc/example-config/Makefile.in \
		${WRKSRC}/doc/example-config/conf.d/Makefile.in
	@${REINPLACE_CMD} -e 's|/usr/bin|${LOCALBASE}/bin|' \
		${WRKSRC}/src/plugins/fts/decode2text.sh

post-configure:
	${REINPLACE_CMD} 's|#define HAVE_CLEARENV 1||g' ${WRKSRC}/config.h

post-patch-LUA-on:
	@${REINPLACE_CMD} -e '/^libdovecot_lua_la_DEPENDENCIES =/ s|LUA_LIBS|true|' \
		${WRKSRC}/src/lib-lua/Makefile.in

post-install:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR} ${STAGEDIR}${DOCSDIR}
	${MV} ${STAGEDIR}${DOCSDIR}/dovecot-openssl.cnf ${STAGEDIR}${EXAMPLESDIR}
	${MV} ${STAGEDIR}${DOCSDIR}/mkcert.sh ${STAGEDIR}${EXAMPLESDIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
