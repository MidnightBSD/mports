# $MidnightBSD: mports/lang/php5/Makefile,v 1.32 2010/11/10 14:05:18 laffer1 Exp $

PORTNAME=	php5
PORTVERSION=	5.2.16
PORTREVISION?=	0
CATEGORIES?=	lang devel www
MASTER_SITES=	${MASTER_SITE_PHP:S/$/:release/}
MASTER_SITE_SUBDIR=	distributions/:release
DISTNAME=	php-${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:release

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	PHP Scripting Language
LICENSE?=	php

LATEST_LINK=	${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}

USE_BZIP2=	yes
.if !defined(PKGNAMESUFFIX)
USE_AUTOTOOLS=	autoconf:262
MAKE_JOBS_SAFE=	yes

CONFIGURE_ARGS=	\
		--enable-versioning \
		--enable-memory-limit \
		--with-layout=GNU \
		--with-config-file-scan-dir=${PREFIX}/etc/php \
		--disable-all \
		--enable-libxml \
		--with-libxml-dir=${LOCALBASE} \
		--with-pcre-regex=yes \
		--enable-reflection \
		--program-prefix=""

DESTDIRNAME=	INSTALL_ROOT
USE_GNOME=	libxml2

OPTIONS=	CLI "Build CLI version" on \
		CGI "Build CGI version" on \
		APACHE "Build Apache module" off \
		DEBUG "Enable debug" off \
		SUHOSIN "Enable Suhosin protection system (not for jails)" on \
		MAILHEAD "Enable mail header patch" off \
		MULTIBYTE "Enable zend multibyte support" off \
		IPV6 "Enable ipv6 support" on \
		REDIRECT "Enable force-cgi-redirect support (CGI only)" off \
		DISCARD "Enable discard-path support (CGI only)" off \
		FASTCGI "Enable fastcgi support (CGI only)" on \
		PATHINFO "Enable path-info-check support (CGI only)" on

MAN1=		php-config.1 phpize.1

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_SUHOSIN)
PATCHFILES+=	suhosin-patch-5.2.14-0.9.7.patch.gz:suhosin
PATCH_SITES+=	http://download.suhosin.org/:suhosin
PATCH_DIST_STRIP=	-p1
PLIST_SUB+=	SUHOSIN=""
.else
PLIST_SUB+=	SUHOSIN="@comment "
.endif

.if defined(WITH_MAILHEAD)
PATCHFILES+=	php-5.2.10-mail-header.patch:mail
PATCH_SITES+=	http://choon.net/opensource/php/:mail
.endif

.if !defined(WITHOUT_CLI)
PHP_SAPI+=	cli
PLIST_SUB+=	CLI=""
MAN1+=		php.1
.else
PLIST_SUB+=	CLI="@comment "
CONFIGURE_ARGS+=--disable-cli
.endif

.if !defined(WITHOUT_CGI)
PHP_SAPI+=	cgi
PLIST_SUB+=	CGI=""
.if defined(WITH_REDIRECT)
CONFIGURE_ARGS+=--enable-force-cgi-redirect
.endif
.if defined(WITH_DISCARD)
CONFIGURE_ARGS+=--enable-discard-path
.endif
.if !defined(WITHOUT_FASTCGI)
CONFIGURE_ARGS+=--enable-fastcgi
.endif
.if defined(WITHOUT_PATHINFO)
CONFIGURE_ARGS+=--disable-path-info-check
.endif
.else
PLIST_SUB+=	CGI="@comment "
CONFIGURE_ARGS+=--disable-cgi
.endif

.if defined(WITH_APACHE)
PHP_SAPI+=	mod
USE_APACHE=	2.2+
CONFIGURE_ARGS+=--with-apxs2=${APXS}
PKGMESSAGE=	${PKGDIR}/pkg-message.mod
MODULENAME=	lib${PORTNAME}
SHORTMODNAME=	${PORTNAME}
PLIST_SUB+=	APACHE=""
.else
PLIST_SUB+=	APACHE="@comment "
.endif

.if !defined(WITH_REGEX_TYPE) || ${WITH_REGEX_TYPE} == "php"
CONFIGURE_ARGS+=--with-regex=php
.elif defined(WITH_REGEX_TYPE) && ${WITH_REGEX_TYPE} == "system"
CONFIGURE_ARGS+=--with-regex=system
.elif defined(WITH_REGEX_TYPE) && ${WITH_REGEX_TYPE} == "apache"
CONFIGURE_ARGS+=--with-regex=apache
.endif

.if !defined(WITH_ZEND_VM) || ${WITH_ZEND_VM} == "CALL"
CONFIGURE_ARGS+=--with-zend-vm=CALL
.elif defined(WITH_ZEND_VM) && ${WITH_ZEND_VM} == "SWITCH"
CONFIGURE_ARGS+=--with-zend-vm=SWITCH
.elif defined(WITH_ZEND_VM) && ${WITH_ZEND_VM} == "GOTO"
CONFIGURE_ARGS+=--with-zend-vm=GOTO
.endif

CONFIGURE_ENV+=	ac_cv_pthreads_lib="" \
		ac_cv_pthreads_cflags="" \
		pthreads_working="yes" \
		lt_cv_path_SED="sed"

MAKE_ENV+=	LDFLAGS="${LDFLAGS}"

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=--enable-debug
.endif

.if defined(WITH_MULTIBYTE)
CONFIGURE_ARGS+=--enable-zend-multibyte
.endif

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=--disable-ipv6
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${TOUCH} ${WRKSRC}/ext/php_config.h
	@${REINPLACE_CMD} "s|^\(extension_dir\)|; \1|" ${WRKSRC}/php.ini-*

pre-configure:
	@${CAT} ${WRKSRC}/acinclude.m4 ${WRKSRC}/build/libtool.m4 > ${WRKSRC}/aclocal.m4
.if defined(WITH_APACHE)
	${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/${APACHEETCDIR}
	${CP} ${LOCALBASE}/${APACHEETCDIR}/httpd.conf ${FAKE_DESTDIR}${LOCALBASE}/${APACHEETCDIR}
.endif

post-build:
	@${ECHO_CMD} "PHP_VER=5" > ${WRKDIR}/php.conf
	@${ECHO_CMD} "PHP_VERSION=${PORTVERSION}" >> ${WRKDIR}/php.conf
	@${ECHO_CMD} "PHP_SAPI=${PHP_SAPI}" >> ${WRKDIR}/php.conf
	@${ECHO_CMD} "PHP_EXT_INC=pcre" >> ${WRKDIR}/php.conf

post-install:
	@${INSTALL_DATA} ${WRKSRC}/php.ini-dist ${PREFIX}/etc
	@${INSTALL_DATA} ${WRKSRC}/php.ini-recommended ${PREFIX}/etc
	@${INSTALL_DATA} ${WRKDIR}/php.conf ${PREFIX}/etc
	@${TOUCH} ${PREFIX}/include/php/ext/php_config.h

.else
.include "${MASTERDIR}/Makefile.ext"
.endif
.include <bsd.port.post.mk>
