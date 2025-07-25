PORTNAME=	squirrelmail
DISTVERSION=	20240929
CATEGORIES=	mail www
MASTER_SITES=	http://snapshots.squirrelmail.org/ \
		http://freebsd.uzsolt.hu/src/
PKGNAMESUFFIX=	${PHP_PKGNAMESUFFIX}
DISTNAME=	${PORTNAME}-${PORTVERSION}_0200-SVN.stable
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Webmail system which accesses mail over IMAP
WWW=		https://www.squirrelmail.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/doc/COPYING

USES=		cpe gettext perl5 php:web,flavors tar:bzip2
USE_PERL5=	run
USE_PHP=	gettext mbstring session xml

CONFLICTS=	squirreloutlook

NO_ARCH=	yes
PORTSCOUT=	ignore:1
SUB_FILES=	pkg-message
SUB_LIST=	SMGROUP=${SMGROUP} \
		SMUSER=${SMUSER} \
		SQUIRRELDIR=${SQUIRRELDIR}

USERS=		${SMUSER}
GROUPS=		${SMGROUP}

PLIST_SUB=	PORTVERSION=${PORTVERSION} \
		SMGROUP=${SMGROUP} \
		SMUSER=${SMUSER} \
		SQUIRRELDIR="${SQUIRRELDIR:S,^${PREFIX}/,,}"

WRKSRC=		${WRKDIR}/${PORTNAME}.stable/${PORTNAME}

OPTIONS_DEFINE=	DATABASE DOCS LDAP
DATABASE_DESC=	PDO database support (must also install a driver)

DATABASE_USE=	PHP=pdo
LDAP_USE=	PHP=ldap

# if you were using WITHOUT_WWWDIR, use SQUIRRELDIR=${PREFIX}/squirrelmail
SQUIRRELDIR?=	${WWWDIR}

SMUSER?=	${WWWOWN}
SMGROUP?=	${WWWGRP}

post-patch:
	@${REINPLACE_CMD} -e 's|ispell|${LOCALBASE}/bin/aspell|g' \
		${WRKSRC}/plugins/squirrelspell/sqspell_config.php
	@${REINPLACE_CMD} -e 's|/usr/bin/fortune|/usr/games/fortune|g' \
		${WRKSRC}/plugins/fortune/fortune_functions.php
	@${REINPLACE_CMD} -e 's|/var/local/squirrelmail|${SQUIRRELDIR}|g' \
		${WRKSRC}/config/conf.pl ${WRKSRC}/config/config_default.php ${WRKSRC}/doc/INSTALL

do-build:
	# Rearrange the documentation
	@${MV} ${WRKSRC}/themes/README.themes ${WRKSRC}/doc
	@(cd ${WRKSRC} && \
		for f in `${FIND} -E plugins -regex \
			'.*(README.*|INSTALL|HISTORY)'`; \
		do \
			${MKDIR} doc/`dirname $$f`; \
			${MV} $$f doc/`dirname $$f`; \
		done)
	@${MV} ${WRKSRC}/doc/plugins/squirrelspell/doc/README ${WRKSRC}/doc/plugins/squirrelspell
	@${RM} -r ${WRKSRC}/doc/plugins/squirrelspell/doc
	@${MV} ${WRKSRC}/plugins/squirrelspell/doc/* ${WRKSRC}/doc/plugins/squirrelspell
	@${RM} ${WRKSRC}/doc/plugins/squirrelspell/index.php
	@${RM} -r ${WRKSRC}/plugins/squirrelspell/doc

	@${ECHO} "left_refresh=300" >> ${WRKSRC}/data/default_pref
	@${MV} ${WRKSRC}/config/config_local.php ${WRKSRC}/config/config_local.php.sample
	@${MV} ${WRKSRC}/data/default_pref ${WRKSRC}/data/default_pref.sample
	@${MKDIR} ${WRKSRC}/attach
	@${CP} -p ${WRKSRC}/data/.htaccess ${WRKSRC}/attach/.htaccess

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${FILESDIR}/111.clean-squirrelmail ${STAGEDIR}${PREFIX}/etc/periodic/daily
	@${MKDIR} ${STAGEDIR}${SQUIRRELDIR}
	${INSTALL_DATA} ${WRKSRC}/index.php ${STAGEDIR}${SQUIRRELDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/configure ${STAGEDIR}${SQUIRRELDIR}
	(cd ${WRKSRC} && \
		${COPYTREE_SHARE} "attach class config data functions help images include locale plugins po scripts src themes" \
			${STAGEDIR}${SQUIRRELDIR})

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
