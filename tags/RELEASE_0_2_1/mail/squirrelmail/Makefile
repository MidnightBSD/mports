# New ports collection makefile for:	squirrelmail
# Date created: 			27 December 2001
# Whom: 				Simon Dick <simond@irrelevant.org>
#
# $FreeBSD: ports/mail/squirrelmail/Makefile,v 1.45 2006/08/11 16:28:19 clsung Exp $
# $MidnightBSD: mports/mail/squirrelmail/Makefile,v 1.7 2008/04/19 18:19:53 laffer1 Exp $
#

PORTNAME=	squirrelmail
PORTVERSION=	1.4.13
PORTREVISION=	1
CATEGORIES=	mail www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		all_locales-1.4.13-20071220${EXTRACT_SUFX}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A webmail system which accesses mail over IMAP
LICENSE=	gpl2

USE_PHP=	session mhash gettext mbstring pcre openssl xml
WANT_PHP_WEB=	yes

USE_BZIP2=	yes
USE_GETTEXT=	yes

.ifdef WITH_DATABASE
RUN_DEPENDS+=	${PREFIX}/share/pear/DB.php:${PORTSDIR}/databases/pear-DB
.endif

.ifdef WITH_LDAP
USE_PHP+=	ldap
.endif

.ifndef WITHOUT_WWWDIR
SQUIRRELDIR?=	${PREFIX}/www/${PORTNAME}
.else
SQUIRRELDIR?=	${PREFIX}/${PORTNAME}
.endif

PLIST_SUB=	PORTVERSION=${PORTVERSION} \
		SQUIRRELDIR="${SQUIRRELDIR:S,^${PREFIX}/,,}"

SUB_FILES=	pkg-message pkg-install pkg-deinstall
SUB_LIST=	SQUIRRELDIR=${SQUIRRELDIR}

PORTDOCS=	*

pre-everything::
	@${ECHO_CMD} "SquirrelMail is installed into ${SQUIRRELDIR}"
	@${ECHO_CMD} "To use the old location ${PREFIX}/${PORTNAME} define"
	@${ECHO_CMD} "WITHOUT_WWWDIR when patching or installing"
	@${ECHO_CMD}
	@${ECHO_CMD} "Use WITH_LDAP to ensure PHP LDAP support is installed"
	@${ECHO_CMD} "Use WITH_DATABASE to ensure PEAR framework for database support is installed"
	@${ECHO_CMD} "   (note that this does not install the database specific PEAR support, e.g. MySQL)"
	@${ECHO_CMD}

post-patch:
.ifndef PATCH_DEBUG
	@${RM} -f ${WRKSRC}/config/config_default.php.orig ${WRKSRC}/functions/global.php.orig
.endif
	@${REINPLACE_CMD} -e 's|ispell|${LOCALBASE}/bin/ispell|g' \
		${WRKSRC}/plugins/squirrelspell/sqspell_config.php
	@${RM} ${WRKSRC}/plugins/squirrelspell/sqspell_config.php.bak

# Rearrange the documentation
do-build:
.for file in AUTHORS ChangeLog COPYING INSTALL README UPGRADE
	@${MV} ${WRKSRC}/${file} ${WRKSRC}/doc/
.endfor
	@${MV} ${WRKSRC}/ReleaseNotes ${WRKSRC}/doc/ReleaseNotes-${PORTVERSION}.txt
	@${MV} ${WRKSRC}/themes/README.themes ${WRKSRC}/doc/
	@cd ${WRKSRC} ; for f in `find plugins -name "README*" -or \
		-name INSTALL -or -name CHANGES -or -name HISTORY`; \
		do \
		${MKDIR} doc/`dirname $$f` ; \
		${MV} $$f doc/`dirname $$f` ; \
	done; \
	${MV} doc/plugins/squirrelspell/doc/README doc/plugins/squirrelspell ; \
	${RM} -rf doc/plugins/squirrelspell/doc ; \
	${MV} plugins/squirrelspell/doc/* doc/plugins/squirrelspell ; \
	${RM} -f doc/plugins/squirrelspell/index.php ; \
	${RM} -rf plugins/squirrelspell/doc
	@${ECHO} "left_refresh=300" >> ${WRKSRC}/data/default_pref
	@${CP} -r ${WRKSRC}/../locale ${WRKSRC}
	@${CP} -r ${WRKSRC}/../images ${WRKSRC}
	@${CP} -r ${WRKSRC}/../help ${WRKSRC}

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${FILESDIR}/111.clean-squirrelmail ${PREFIX}/etc/periodic/daily
	${MKDIR} ${SQUIRRELDIR}
	@${CP} -pv ${WRKSRC}/index.php ${SQUIRRELDIR}
	@${CP} -pv ${WRKSRC}/configure ${SQUIRRELDIR}
.for DIR in class config data functions help images include locale plugins po src themes
	@${CP} -rpv ${WRKSRC}/${DIR} ${SQUIRRELDIR}
.endfor
	${CHOWN} -R ${WWWOWN}:${WWWGRP} ${SQUIRRELDIR}/data
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	@${CP} -Rv ${WRKSRC}/doc/* ${DOCSDIR}
.endif


.include <bsd.port.mk>
