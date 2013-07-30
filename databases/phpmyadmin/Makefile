# $MidnightBSD: mports/databases/phpmyadmin/Makefile,v 1.40 2013/06/19 01:56:22 laffer1 Exp $

PORTNAME=	phpMyAdmin
DISTVERSION=	4.0.4.1
CATEGORIES=	databases www
MASTER_SITES=	SF/${PORTNAME:L}/${PORTNAME}/${DISTVERSION}
DISTNAME=	${PORTNAME}-${DISTVERSION}-all-languages

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of PHP-scripts to manage MySQL over the web
LICENSE=	gpl2

USE_XZ=		yes
NO_BUILD=	yes
.if !defined(WITHOUT_PHP_DEPENDS)
USE_PHP=	ctype session filter mbstring json
.endif

# Note: default settings will pull in X11 client support.  If you don't
# want this, either turn off GD in the config dialog, or else turn off
# FONTCONFIG in the graphics/gd port options.

PHP_MODULE_OPTIONS=	APC BZ2 GD MCRYPT OPENSSL PDF XML ZIP ZLIB
OPTIONS_DEFINE=		${PHP_MODULE_OPTIONS}
OPTIONS_DEFAULT=	APC BZ2 GD MCRYPT MYSQLI OPENSSL PDF XML ZIP ZLIB

OPTIONS_MULTI=		DB_connect
OPTIONS_MULTI_DB_connect=	MYSQL MYSQLI

APC_DESC=	PHP APC (animated progress bar) support
BZ2_DESC=	PHP bzip2 library support
GD_DESC=	PHP GD library support (requires X11)
MCRYPT_DESC=	PHP MCrypt library support
MYSQLI_DESC=	PHP Improved MySQL client support
MYSQL_DESC=	PHP MySQL support via mysql client
OPENSSL_DESC=	PHP OpenSSL support
PDF_DESC=	PHP PDFlib support
XML_DESC=	PHP XML support (Export to OpenDoc)
ZIP_DESC=	PHP Zip compression support
ZLIB_DESC=	PHP ZLIB support

.include <bsd.mport.options.mk>

WANT_PHP_WEB=	yes

GROUPS?=	${WWWGRP}
CFGFILE=	config.inc.php

PLIST=		${WRKDIR}/plist
PLIST_SUB+=	PMA_GRP=${GROUPS}

SUB_LIST+=	PKGNAME=${PKGNAME}
SUB_FILES+=	pkg-message

LATEST_LINK=	${PORTNAME}${PKGNAMESUFFIX}

.if !defined(WITHOUT_PHP_DEPENDS)

.for opt in ${PHP_MODULE_OPTIONS} ${OPTIONS_MULTI_DB_connect}
.    if ${PORT_OPTIONS:M${opt}}
USE_PHP+=	${opt:L}
.    endif
.endfor

.endif

.SILENT:

# When creating a package, empty directories will not be generated
# from the pkg tarball.	 Therefore make sure no directories are empty.

post-patch:
	cd ${WRKSRC} ; \
	for emptydir in $$( ${FIND} . -type d -empty -print ) ; do \
	    ${TOUCH} $${emptydir}/.keep-me ; \
	done ; \
	${CP} ${FILESDIR}/${CFGFILE}.sample ${WRKSRC}/${CFGFILE}.sample ; \
	${FIND} . ! -type d ! -name ${CFGFILE}.sample ! -name '*.bak' | \
	    ${SORT} | ${SED} -e "s,^\.,%%WWWDIR%%,"   >${PLIST} ; \
	${CAT} ${PKGDIR}/pkg-plist-chunk	     >>${PLIST} ; \
	${FIND} . -type d | ${SORT} -r | ${SED} \
	    -e "s,^\.$$,@dirrmtry %%WWWDIR%%," \
	    -e "s,^\.,@dirrm %%WWWDIR%%,"	     >>${PLIST}

do-install: install-app install-conf

install-app:
	cd ${WRKSRC} ; \
	for src in $$( ${FIND} . ! -name .cvsignore ! -name '*.bak' ) ; do \
	    dst=${WWWDIR}$${src#.} ; \
	    if ${TEST} -d "$$src" ; then \
		${MKDIR} "$$dst" ; \
	    else \
		${INSTALL_DATA} "$$src" "$$dst" ; \
	    fi \
	done

install-conf: install-app
	cd ${WWWDIR} ; \
	${CHMOD} 0640 ${CFGFILE}.sample ; \
	${CHGRP} ${WWWGRP} ${CFGFILE}.sample ; \
	if ${TEST} ! -f ${CFGFILE} ; then \
	    ${CP} -p ${CFGFILE}.sample ${CFGFILE} ; \
	fi

.include <bsd.port.mk>
