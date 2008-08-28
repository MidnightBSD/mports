# New ports collection makefile for: phpMyAdmin
# Date created:		19 Jan 2001
# Whom:			nbm
#
# $FreeBSD: ports/databases/phpmyadmin/Makefile,v 1.67 2007/03/07 21:34:20 thierry Exp $
# $MidnightBSD: mports/databases/phpmyadmin/Makefile,v 1.13 2008/06/26 18:58:59 laffer1 Exp $
#

PORTNAME=	phpMyAdmin
DISTVERSION=	2.11.8
CATEGORIES=	databases www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	phpmyadmin
DISTNAME=	${PORTNAME}-${PORTVERSION}-all-languages

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of PHP-scripts to manage MySQL over the web
LICENSE=	gpl2

USE_BZIP2=	yes
NO_BUILD=	yes
.if !defined(WITHOUT_PHP_DEPENDS)
USE_PHP=	ctype mysql pcre session
.endif

SUB_LIST+=	"MYADMDIR=${MYADMDIR}" \
		"PKGNAME=${PKGNAME}"
SUB_FILES=	pkg-message

WANT_PHP_WEB=	yes

# Copy the way lang/php5-extensions deals with its OPTIONS -- avoids
# problems with include of bsd.port.pre.mk

OPTIONS=	BZ2	 "bzip2 library support" on \
		GD	 "GD library support" on \
		MYSQLI	 "Improved MySQL support" off \
		OPENSSL	 "OpenSSL support" on \
		PDF	 "PDFlib support (implies GD)" on \
		ZLIB	 "ZLIB support" on \
		MCRYPT   "MCrypt library support" on \
		MBSTRING "Multi-byte character-set string support" on

PORT_DBDIR?=	${DESTDIR}/var/db/ports
LATEST_LINK=	${PORTNAME}${PKGNAMESUFFIX}
OPTIONSFILE?=	${PORT_DBDIR}/${LATEST_LINK}/options

.if exists(${OPTIONSFILE})
.include "${OPTIONSFILE}"
.endif

.if !defined(WITHOUT_PHP_DEPENDS)
# Options that default to on:
.for opt in BZ2 GD OPENSSL PDF ZLIB MCRYPT MBSTRING
.    if !defined(WITHOUT_${opt}) || defined(WITH_${opt})
USE_PHP+=	${opt:L}
.    endif
.endfor

# Options that default to off:
.for opt in MYSQLI
.    if defined(WITH_${opt}) && !defined(WITHOUT_${opt})
USE_PHP+=	${opt:L}
.    endif
.endfor
.endif

MYADMDIR?=	www/phpMyAdmin
MYADMGRP?=	${WWWGRP}
CFGFILE=	config.inc.php

PLIST=		${WRKDIR}/plist
PLIST_SUB+=	MYADMDIR=${MYADMDIR} MYADMGRP=${MYADMGRP}

.SILENT:

do-build:
	@${DO_NADA}

# When creating a package, empty directories will not be generated
# from the pkg tarball.  Therefore make sure no directories are empty.

post-patch:
	cd ${WRKSRC} ; \
	for emptydir in $$( ${FIND} . -type d -empty -print ) ; do \
	    ${TOUCH} $${emptydir}/.keep-me ; \
	done
	${CP} ${FILESDIR}/${CFGFILE}.sample ${WRKSRC}/${CFGFILE}.sample
	cd ${WRKSRC} ; \
	${FIND} . ! -type d ! -name ${CFGFILE}.sample | ${SORT} | \
	    ${SED} -e "s,^\.,%%MYADMDIR%%,"           >${PLIST} ; \
	${CAT} ${PKGDIR}/pkg-plist-chunk             >>${PLIST} ; \
	${FIND} . -type d | ${SORT} -r | ${SED} \
	     -e "s,^\.$$,@dirrmtry %%MYADMDIR%%," \
	     -e "s,^\.,@dirrm %%MYADMDIR%%,"         >>${PLIST}

do-install: install-app install-conf

install-app:
	cd ${WRKSRC} ; \
	for src in $$( ${FIND} . ! -name .cvsignore ) ; do \
	    dst=${TARGETDIR}/${MYADMDIR}$${src#.} ; \
	    if ${TEST} -d $$src ; then \
	        ${MKDIR} $$dst ; \
	    else \
	        ${INSTALL_DATA} $$src $$dst ; \
	    fi \
	done

install-conf: install-app
	cd ${TARGETDIR}/${MYADMDIR} ; \
	${CHMOD} 0640 ${CFGFILE}.sample ; \
	${CHGRP} ${MYADMGRP} ${CFGFILE}.sample ; \
	if ${TEST} ! -f ${CFGFILE} ; then \
	    ${CP} -p ${CFGFILE}.sample ${CFGFILE} ; \
	fi

.include <bsd.port.mk>
