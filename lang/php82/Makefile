PORTNAME=	php82
DISTVERSION=	8.2.28
PORTREVISION?=	0
CATEGORIES?=	lang devel www
MASTER_SITES=	https://downloads.php.net/~sergey/ \
		PHP/distributions
DISTNAME=	php-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PHP Scripting Language (8.2.X branch)
WWW=		https://www.php.net/

LICENSE=	PHP301

USES+=		compiler:c11 cpe gnome pkgconfig tar:xz
CPE_PRODUCT=	php
PHP_VER=	82

CONFLICTS_INSTALL?=	php[0-9][0-9]${PKGNAMESUFFIX}

NO_TEST=	yes

.if !defined(PKGNAMESUFFIX)
LIB_DEPENDS=	libargon2.so:security/libargon2 \
		libpcre2-8.so:devel/pcre2

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--disable-all \
			--program-prefix="" \
			--with-config-file-scan-dir=${PREFIX}/etc/php \
			--with-layout=GNU \
			--with-libxml \
			--with-openssl \
			--with-password-argon2=${LOCALBASE} \
			--disable-dtrace
DESTDIRNAME=		INSTALL_ROOT

USES+=		autoreconf:build ssl
USE_GNOME=	libxml2

CPPFLAGS=	-I${LOCALBASE}/include

LDFLAGS=	-L${OPENSSLLIB} -lcrypto -lssl
# PR230207 Allow relocations against read-only segments (override lld default)
LDFLAGS_i386=	-Wl,-z,notext

OPTIONS_DEFINE+=		CGI CLI DEBUG EMBED FPM IPV6 LINKTHR \
				MYSQLND PHPDBG ZTS
OPTIONS_DEFAULT=		CGI CLI EMBED FPM LINKTHR MYSQLND
NO_OPTIONS_SORT=	yes
OPTIONS_SUB=			yes

CGI_DESC=	Build CGI version
CLI_DESC=	Build CLI version
EMBED_DESC=	Build embedded library
FPM_DESC=	Build FPM version
LINKTHR_DESC=	Link thread lib (for threaded extensions)
MYSQLND_DESC=	Build with MySQL Native Driver
PHPDBG_DESC=	Interactive PHP debugger
ZTS_DESC=	Force Zend Thread Safety (ZTS) build

CGI_CONFIGURE_OFF=	--disable-cgi
CGI_VARS=		PHP_SAPI+=cgi
CLI_CONFIGURE_OFF=	--disable-cli
CLI_VARS=		PHP_SAPI+=cli
DEBUG_CONFIGURE_ON=	--enable-debug
EMBED_CONFIGURE_ON=	--enable-embed
EMBED_VARS=		PHP_SAPI+=embed
FPM_CONFIGURE_ON=	--enable-fpm \
			--with-fpm-group=${WWWGRP} \
			--with-fpm-user=${WWWOWN}
FPM_VARS=		PHP_SAPI+=fpm \
			USE_RC_SUBR+=php-fpm
IPV6_CONFIGURE_OFF=	--disable-ipv6
LINKTHR_LIBS=		-lpthread
MYSQLND_CONFIGURE_ON=	--enable-mysqlnd
PHPDBG_CONFIGURE_ON=	--enable-phpdbg
PHPDBG_VARS=		PHP_SAPI+=phpdbg
ZTS_CONFIGURE_ON=	--enable-zts
ZTS_CONFIGURE_ENV=	pthreads_working="yes"

.include <bsd.port.pre.mk>

.if ${ARCH} == riscv64
CONFIGURE_ARGS+=	--without-pcre-jit
.endif

.if defined(PKGNAMEPREFIX)
USES+=			apache:2.2+
.include "${PORTSDIR}/Mk/extensions/apache.mk"
.if ${PORT_OPTIONS:MAP2FILTER}
CONFIGURE_ARGS+=	--with-apxs2filter=${APXS}
.else
CONFIGURE_ARGS+=	--with-apxs2=${APXS}
.endif
PLIST=			${PKGDIR}/pkg-plist.mod
PKGMESSAGE=		${PKGDIR}/pkg-message.mod
MODULENAME=		libphp
SHORTMODNAME=		php
WARNING=		"!!! If you have a threaded Apache, you must build ${PHP_PORT} with ZTS support to enable thread-safety in extensions !!!"
.endif

.if ${PORT_OPTIONS:MPHPDBG} && ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=	--enable-phpdbg-debug
.endif

.if ${PORT_OPTIONS:MCLI} || ${PORT_OPTIONS:MEMBED}
PLIST_SUB+=	SAPI_INC=""
.else
PLIST_SUB+=	SAPI_INC="@comment "
.endif

.if ${OSVERSION} <= 202003
CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd11.4
.else
CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd12.4
.endif

CONFIGURE_ENV+=	ac_cv_decimal_fp_supported="no" \
		lt_cv_path_SED="sed" \
		OPENSSL_CFLAGS="-I${OPENSSLINC}" \
		OPENSSL_LIBS="-L${OPENSSLLIB} -lssl -lcrypto" \
		PHP_OPENSSL=yes

post-patch:
	@${TOUCH} ${WRKSRC}/ext/php_config.h

post-patch-FPM-on:
	@${REINPLACE_CMD} -e "s|^;\(pid\)|\1|;s|^;\(pm\.[a-z_]*_servers\)|\1|" \
		${WRKSRC}/sapi/fpm/php-fpm.conf.in

pre-configure:
	@(cd ${WRKSRC} && ${SETENV} MAKE=${MAKE_CMD} ./buildconf --force)

.if !defined(PKGNAMEPREFIX)
post-build:
	@${ECHO_CMD} "PHP_VER=${PHP_VER}" > ${WRKDIR}/php.conf
	@${ECHO_CMD} "PHP_VERSION=${PORTVERSION}" >> ${WRKDIR}/php.conf
	@${ECHO_CMD} "PHP_SAPI=${PHP_SAPI}" >> ${WRKDIR}/php.conf
	@${ECHO_CMD} -n "PHP_EXT_DIR=" >> ${WRKDIR}/php.conf
	@${SH} ${WRKSRC}/scripts/php-config --extension-dir | ${SED} -ne 's,^${PREFIX}/lib/php/,,p' >> ${WRKDIR}/php.conf
	@${ECHO_CMD} "PHP_EXT_INC=hash json openssl pcre random spl" >> ${WRKDIR}/php.conf

post-install:
	${INSTALL_DATA} ${WRKSRC}/php.ini-development ${WRKSRC}/php.ini-production \
		${WRKDIR}/php.conf ${PREFIX}/etc

post-install-CLI-on:
	${STRIP_CMD} ${FAKE_DESTDIR}/${PREFIX}/bin/php

post-install-CGI-on:
	${STRIP_CMD} ${FAKE_DESTDIR}/${PREFIX}/bin/php-cgi

post-install-EMBED-on:
	${STRIP_CMD} ${FAKE_DESTDIR}/${PREFIX}/lib/libphp.so

post-install-FPM-on:
	${STRIP_CMD} ${FAKE_DESTDIR}/${PREFIX}/sbin/php-fpm

post-install-PHPDBG-on:
	${STRIP_CMD} ${FAKE_DESTDIR}/${PREFIX}/bin/phpdbg

.else
do-install:
	${MKDIR} ${PREFIX}/${APACHEMODDIR}
	${INSTALL_LIB} ${WRKSRC}/libs/${MODULENAME}.so \
		${PREFIX}/${APACHEMODDIR}
.endif

.else
COMMENT=	The ${PHP_MODNAME} shared extension for php

USES+=		php:ext,noflavors
PHP_MODNAME=	${PKGNAMESUFFIX:S/-//}
PHP_VER=	82
IGNORE_WITH_PHP=	80 81 83

EXTSUBDIR=	${DISTNAME}/ext/${PHP_MODNAME}
WRKSRC=		${WRKDIR}/${EXTSUBDIR}
PATCHDIR=	${.CURDIR}/files
PLIST=		${NONEXISTENT}

EXTRACT_AFTER_ARGS?=	${EXTSUBDIR}

.if ${PHP_MODNAME} == "bcmath"
CONFIGURE_ARGS+=	--enable-bcmath

PHP_HEADER_DIRS=	libbcmath/src
.endif

.if ${PHP_MODNAME} == "bz2"
CONFIGURE_ARGS+=	--with-bz2=/usr
.endif

.if ${PHP_MODNAME} == "calendar"
CONFIGURE_ARGS+=	--enable-calendar
.endif

.if ${PHP_MODNAME} == "ctype"
CONFIGURE_ARGS+=	--enable-ctype
.endif

.if ${PHP_MODNAME} == "curl"
LIB_DEPENDS+=	libcurl.so:ftp/curl

CONFIGURE_ARGS+=	--with-curl=${LOCALBASE}
USES+=			pkgconfig
.endif

.if ${PHP_MODNAME} == "dba"
CONFIGURE_ARGS+=	--enable-dba

OPTIONS_DEFINE=		CDB DB4 FLATFILE GDBM INIFILE LMDB QDBM TOKYO
OPTIONS_DEFAULT=	CDB FLATFILE INIFILE

CDB_DESC=	cdb database support
DB4_DESC=	Berkeley DB4 support
FLATFILE_DESC=	flatfile support
GDBM_DESC=	GDBM database support
INIFILE_DESC=	INI file support
LMDB_DESC=	LMDB database support
QDBM_DESC=	QDBM database support
TOKYO_DESC=	Tokyo Cabinet database support

CDB_CONFIGURE_OFF=	--without-cdb
DB4_CONFIGURE_ON=	--with-db4=${LOCALBASE}
DB4_USES=		bdb
DB4_VARS=		WITH_BDB_HIGHEST=yes
FLATFILE_CONFIGURE_ON=	--disable-flatfile
GDBM_CONFIGURE_ARGS=	--with-gdbm=${LOCALBASE}
GDBM_LIB_DEPENDS=	libgdbm.so:databases/gdbm
INIFILE_CONFIGURE_OFF=	--disable-inifile
LMDB_LIB_DEPENDS=	liblmdb.so:databases/lmdb
LMDB_CONFIGURE_ARGS=	--with-lmdb=${LOCALBASE}
QDBM_LIB_DEPENDS=	libqdbm.so:databases/qdbm
QDBM_CONFIGURE_ARGS=	--with-qdbm=${LOCALBASE}
TOKYO_LIB_DEPENDS=	libtokyocabinet.so:databases/tokyocabinet
TOKYO_CONFIGURE_ON=	--with-tcadb=${LOCALBASE}

PHP_HEADER_DIRS=	libcdb libflatfile libinifile
.endif

.if ${PHP_MODNAME} == "dom"
CONFIGURE_ARGS+=	--enable-dom

USES+=		pkgconfig
USE_GNOME=	libxml2
.endif

.if ${PHP_MODNAME} == "enchant"
LIB_DEPENDS+=		libenchant.so:textproc/enchant
CONFIGURE_ARGS+=	--with-enchant=${LOCALBASE}
USES+=			pkgconfig
.endif

.if ${PHP_MODNAME} == "exif"
CONFIGURE_ARGS+=	--enable-exif
.endif

.if ${PHP_MODNAME} == "ffi"
LIB_DEPENDS=		libffi.so:devel/libffi
CONFIGURE_ARGS+=	--with-ffi
.endif

.if ${PHP_MODNAME} == "fileinfo"
CONFIGURE_ARGS+=	--enable-fileinfo

PHP_HEADER_DIRS=	libmagic
.endif

.if ${PHP_MODNAME} == "filter"
CONFIGURE_ARGS+=	--enable-filter
.endif

.if ${PHP_MODNAME} == "ftp"
CONFIGURE_ARGS+=	--enable-ftp

CONFIGURE_ENV+=	OPENSSL_CFLAGS="-I${OPENSSLINC}" \
		OPENSSL_LIBS="-L${OPENSSLLIB} -lssl -lcrypto" \
		PHP_OPENSSL=yes

LDFLAGS+=	-L${OPENSSLLIB} -lcrypto -lssl
USES+=		pkgconfig ssl
.endif

.if ${PHP_MODNAME} == "gd"
LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libgd.so:graphics/gd \
		libpng.so:graphics/png
USES+=		jpeg

CONFIGURE_ARGS+=	--enable-gd \
			--with-external-gd

EXTRACT_AFTER_ARGS=	--no-same-owner --no-same-permissions --exclude libgd \
			php-${DISTVERSION}/ext/gd

OPTIONS_DEFINE=	JIS WEBP X11

JIS_DESC=		Enable JIS-mapped Japanese font support
WEBP_DESC=		Enable WebP image format support
X11_DESC=		Enable XPM support
JIS_CONFIGURE_ON=	--enable-gd-jis-conv
WEBP_CONFIGURE_ON=	--with-webp
WEBP_LIB_DEPENDS=	libwebp.so:graphics/webp
X11_CONFIGURE_ON=	--with-xpm
X11_USE=		XORG=xpm
X11_USES=		xorg
.endif

.if ${PHP_MODNAME} == "gettext"
CONFIGURE_ARGS+=	--with-gettext=${LOCALBASE}

USES+=		gettext
.endif

.if ${PHP_MODNAME} == "gmp"
LIB_DEPENDS+=	libgmp.so:math/gmp

CONFIGURE_ARGS+=	--with-gmp=${LOCALBASE}
.endif

.if ${PHP_MODNAME} == "iconv"
CONFIGURE_ARGS+=	--with-iconv=${LOCALBASE}

USES+=		iconv:translit
.endif

.if ${PHP_MODNAME} == "imap"
PHP_MOD_PRIO=		30
OPTIONS_RADIO=		CLIENT
OPTIONS_RADIO_CLIENT=	CCLIENT PANDA
OPTIONS_DEFAULT=	PANDA
CCLIENT_DESC=		Uses the original but unmaintained cclient
PANDA_DESC=		Uses the forked panda-cclient instead of the original cclient
PANDA_LIB_DEPENDS=	libc-client4.so.10:mail/panda-cclient
PANDA_LIB_DEPENDS_OFF=	libc-client4.so.9:mail/cclient

CONFIGURE_ARGS+=	--with-imap-ssl=${OPENSSLBASE} \
			--with-imap=${LOCALBASE}

CONFIGURE_ENV+=	OPENSSL_CFLAGS="-I${OPENSSLINC}" \
		OPENSSL_LIBS="-L${OPENSSLLIB} -lssl -lcrypto" \
		PHP_OPENSSL=yes

LDFLAGS+=	-L${OPENSSLLIB} -lcrypto -lssl
USES+=		ssl
.endif

.if ${PHP_MODNAME} == "intl"
LIB_DEPENDS=	libicui18n.so:devel/icu
USES+=		pkgconfig
CPPFLAGS+=	-DU_USING_ICU_NAMESPACE=1
.endif

.if ${PHP_MODNAME} == "json"
CONFIGURE_ARGS+=	--enable-json
BUILD_DEPENDS=		re2c:devel/re2c
.endif

.if ${PHP_MODNAME} == "ldap"
CONFIGURE_ARGS+=	--with-ldap=${LOCALBASE}

USE_OPENLDAP=	yes

. ifdef(WANT_OPENLDAP_SASL)
CONFIGURE_ARGS+=--with-ldap-sasl=${LOCALBASE}
. endif

.endif

.if ${PHP_MODNAME} == "mbstring"

CONFIGURE_ARGS+=	--enable-mbstring

OPTIONS_DEFINE=		REGEX
OPTIONS_DEFAULT=	REGEX

REGEX_DESC=		Enable multibyte regex support
REGEX_LIB_DEPENDS=	libonig.so:devel/oniguruma
REGEX_CONFIGURE_OFF=	--disable-mbregex

PHP_HEADER_DIRS=	libmbfl libmbfl/filters libmbfl/mbfl libmbfl/nls
.endif

.if ${PHP_MODNAME} == "mysqli"
OPTIONS_DEFINE=		MYSQLND
OPTIONS_DEFAULT=	MYSQLND

MYSQLND_DESC=		Use MySQL Native Driver
MYSQLND_CONFIGURE_ON=	--with-mysqli=mysqlnd
MYSQLND_CONFIGURE_OFF=	--with-mysqli=${LOCALBASE}/bin/mysql_config
MYSQLND_USES_OFF=	mysql
.endif

.if ${PHP_MODNAME} == "odbc"
LIB_DEPENDS+=	libodbc.so:databases/unixODBC

CONFIGURE_ARGS+=	--enable-odbc \
			--with-unixODBC=${LOCALBASE}
.endif

.if ${PHP_MODNAME} == "opcache"
# This is needed by Zend extensions, keep before everything.
PHP_MOD_PRIO=		10
CONFIGURE_ARGS+=	--enable-opcache
.endif

.if ${PHP_MODNAME} == "pcntl"
CONFIGURE_ARGS+=	--enable-pcntl
.endif

.if ${PHP_MODNAME} == "pdo"
CONFIGURE_ARGS+=	--enable-pdo
.endif

.if ${PHP_MODNAME} == "pdo_dblib"
CONFIGURE_ARGS+=	--with-pdo-dblib=${LOCALBASE}

USE_PHP=	pdo:build

OPTIONS_DEFINE=	MSSQL

MSSQL_DESC=		Enable Microsoft SQL Server support
MSSQL_LIB_DEPENDS=	libsybdb.so:databases/freetds
MSSQL_LIB_DEPENDS_OFF=	libct.so:databases/freetds
.endif

.if ${PHP_MODNAME} == "pdo_firebird"
CONFIGURE_ARGS+=	--with-pdo-firebird=${LOCALBASE}

USES+=		firebird
USE_PHP=	pdo:build
.endif

.if ${PHP_MODNAME} == "pdo_odbc"
LIB_DEPENDS+=		libodbc.so:databases/unixODBC
CONFIGURE_ARGS+=	--with-pdo-odbc=unixODBC,${LOCALBASE}

USE_PHP=	pdo:build
.endif

.if ${PHP_MODNAME} == "pdo_mysql"
OPTIONS_DEFINE=		MYSQLND
OPTIONS_DEFAULT=	MYSQLND

MYSQLND_DESC=		Use MySQL Native Driver

MYSQLND_CONFIGURE_OFF=	--with-pdo-mysql=${LOCALBASE} \
			--with-zlib-dir=/usr
MYSQLND_USES_OFF=	mysql
MYSQLND_CONFIGURE_ON=	--with-pdo-mysql=mysqlnd

USE_PHP=	pdo:build
.endif

.if ${PHP_MODNAME} == "pdo_pgsql"
USES+=		pgsql

CONFIGURE_ARGS+=	--with-pdo-pgsql=${LOCALBASE}

USE_PHP=	pdo:build
.endif

.if ${PHP_MODNAME} == "pdo_sqlite"
USES+=			localbase sqlite
CONFIGURE_ARGS+=	--with-pdo-sqlite=${LOCALBASE}

USE_PHP=	pdo:build
.endif

.if ${PHP_MODNAME} == "pgsql"
USES+=		pgsql

CONFIGURE_ARGS+=	--with-pgsql=${LOCALBASE}
.endif

.if ${PHP_MODNAME} == "phar"
CONFIGURE_ARGS+=	--enable-phar
.endif

.if ${PHP_MODNAME} == "posix"
CONFIGURE_ARGS+=	--enable-posix
.endif

.if ${PHP_MODNAME} == "pspell"
LIB_DEPENDS+=	libaspell.so:textproc/aspell

CONFIGURE_ARGS+=	--with-pspell=${LOCALBASE}
.endif

.if ${PHP_MODNAME} == "readline"
CONFIGURE_ARGS+=	--with-readline=/usr
USES+=			readline
.endif

.if ${PHP_MODNAME} == "session"
CONFIGURE_ARGS+=	--enable-session
PHP_MOD_PRIO=		18
.endif

.if ${PHP_MODNAME} == "shmop"
CONFIGURE_ARGS+=	--enable-shmop
.endif

.if ${PHP_MODNAME} == "simplexml"
CONFIGURE_ARGS+=	--enable-simplexml

USES+=		pkgconfig
USE_GNOME=	libxml2
.endif

.if ${PHP_MODNAME} == "snmp"
CONFIGURE_ARGS+=	--with-snmp=${LOCALBASE}

CONFIGURE_ENV+=	ac_cv_buggy_snprint_value="no"

LIB_DEPENDS+=	libnetsnmp.so:net-mgmt/net-snmp
LDFLAGS+=	-L${OPENSSLLIB} -lcrypto -lssl
USES+=		ssl
.endif

.if ${PHP_MODNAME} == "soap"
CONFIGURE_ARGS+=	--enable-soap

USES+=		pkgconfig
USE_GNOME=	libxml2
.endif

.if ${PHP_MODNAME} == "sockets"
CONFIGURE_ARGS+=	--enable-sockets
CONFIGURE_ENV+=	LOCAL_CREDS_PERSISTENT=yes
.endif

.if ${PHP_MODNAME} == "sodium"
CONFIGURE_ARGS+=	--with-sodium=${LOCALBASE}
LIB_DEPENDS+=		libsodium.so:security/libsodium
.endif

.if ${PHP_MODNAME} == "sqlite3"
USES+=			localbase pkgconfig sqlite
CONFIGURE_ARGS+=	--with-sqlite3=${LOCALBASE}
.endif

.if ${PHP_MODNAME} == "sysvmsg"
CONFIGURE_ARGS+=	--enable-sysvmsg
.endif

.if ${PHP_MODNAME} == "sysvsem"
CONFIGURE_ARGS+=	--enable-sysvsem
.endif

.if ${PHP_MODNAME} == "sysvshm"
CONFIGURE_ARGS+=	--enable-sysvshm
.endif

.if ${PHP_MODNAME} == "tidy"
CONFIGURE_ARGS+=	--with-tidy=${LOCALBASE}

LIB_DEPENDS+=	libtidy.so:www/tidy-lib
.endif

.if ${PHP_MODNAME} == "tokenizer"
CONFIGURE_ARGS+=	--enable-tokenizer
.endif

.if ${PHP_MODNAME} == "xml"
CONFIGURE_ARGS+=	--enable-xml

USES+=		pkgconfig
USE_GNOME=	libxml2
.endif

.if ${PHP_MODNAME} == "xmlreader"
CONFIGURE_ARGS+=	--enable-xmlreader

USE_GNOME=	libxml2

USE_PHP=	dom:build
.endif

.if ${PHP_MODNAME} == "xmlrpc"
CONFIGURE_ARGS+=	--with-iconv-dir=${LOCALBASE} \
			--with-xmlrpc

USES+=		iconv:translit
USE_GNOME=	libxml2

PHP_HEADER_DIRS=	libxmlrpc

USE_PHP=	xml:build
.endif

.if ${PHP_MODNAME} == "xmlwriter"
CONFIGURE_ARGS+=	--enable-xmlwriter

USES+=		pkgconfig
USE_GNOME=	libxml2
.endif

.if ${PHP_MODNAME} == "xsl"
CONFIGURE_ARGS+=	--with-xsl=${LOCALBASE}

USE_GNOME=	libxslt
USE_PHP=	dom:build xml:build
.endif

.if ${PHP_MODNAME} == "zip"
LIB_DEPENDS+=	libzip.so:archivers/libzip

CONFIGURE_ARGS+=	--with-zip \
			--with-zlib-dir=/usr
USES+=			pkgconfig
.endif

.if ${PHP_MODNAME} == "zlib"
CONFIGURE_ARGS+=	--with-zlib=/usr
USES+=			pkgconfig
.endif

.include <bsd.port.pre.mk>

.if ${OSVERSION} <= 202003
CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd11.4
.else
CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd12.4
.endif

.if ${PHP_MODNAME} == "sqlite3" || ${PHP_MODNAME} == "zlib"
post-extract:
	@${MV} ${WRKSRC}/config0.m4 ${WRKSRC}/config.m4
.endif

.if ${PHP_MODNAME} == "xml"
post-extract:
	@${MKDIR} ${WRKSRC}/ext/xml
	@${CP} ${WRKSRC}/expat_compat.h ${WRKSRC}/ext/xml
.endif
.endif

post-fake:
	-${REINPLACE_CMD} -e 's/DragonFly/MidnightBSD/g' \
		-e 's/dragonfly/midnightbsd/g' \
		${FAKE_DESTDIR}${PREFIX}/lib/php/build/libtool.m4

pre-build:
	-${REINPLACE_CMD} -e 's/DragonFly/MidnightBSD/g' \
		-e 's/dragonfly/midnightbsd/g' \
		${WRKSRC}/ext/${PHP_MODNAME}/libtool

.include <bsd.port.post.mk>
