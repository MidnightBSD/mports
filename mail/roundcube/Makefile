PORTNAME=	roundcube
DISTVERSION=	1.6.11
PORTEPOCH=	1
CATEGORIES?=	mail www
MASTER_SITES=	https://github.com/roundcube/roundcubemail/releases/download/${DISTVERSION}/
DISTNAME=	${PORTNAME}mail-${DISTVERSION}-complete
PKGNAMESUFFIX=	${PHP_PKGNAMESUFFIX}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Fully skinnable XHTML/CSS webmail written in PHP
WWW=		https://roundcube.net/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}mail-${DISTVERSION}

RCUBECOMP=	SQL config .htaccess index.php installer logs \
		plugins program skins temp vendor
PORTDOCS=	CHANGELOG.md INSTALL README.md UPGRADING

USES=		cpe php:web,flavors
CPE_PRODUCT=	webmail
CPE_VENDOR=	roundcube

USE_PHP=	mbstring session iconv dom xml intl zip filter fileinfo exif ctype

OPTIONS_DEFINE=	LDAP GD PSPELL NSC DOCS EXAMPLES
OPTIONS_MULTI=	DB
OPTIONS_MULTI_DB=	MYSQL PGSQL SQLITE
OPTIONS_DEFAULT=MYSQL

DB_DESC=	Database backend
MYSQL_DESC=	Use MySQL backend
PGSQL_DESC=	Use PostgreSQL backend
SQLITE_DESC=	Use SQLite backend
LDAP_DESC=	Enable LDAP support (address book)
GD_DESC=	Enable GD support (image conversion)
PSPELL_DESC=	Enable PSpell support (internal spellcheck)
NSC_DESC=	Install network spellchecker

GD_VARS=	use_php+=gd
LDAP_VARS=	use_php+=ldap
MYSQL_VARS=	use_php+=pdo_mysql
NSC_IMPLIES=	PSPELL
NSC_VARS=	use_php+=simplexml
PGSQL_VARS=	use_php+=pdo_pgsql
PSPELL_VARS=	use_php+=pspell
SQLITE_VARS=	use_php+=pdo_sqlite

SUB_FILES=	newsyslog.conf

post-patch:
	@${FIND} ${WRKSRC} -name \*.orig -type f -delete

do-install:
	-${MKDIR} ${WWWDIR}
	@cd ${WRKSRC} && ${COPYTREE_BIN} bin ${WWWDIR}
.for i in ${RCUBECOMP}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} ${i} ${WWWDIR}
.endfor
	@(cd ${WRKSRC}; ${FIND} bin ${RCUBECOMP} -not -type d) | ${SORT} | \
		${SED} -ne 's,^,${WWWDIR_REL}/,p' >> ${TMPPLIST}
	@${ECHO_CMD} '@postexec chown ${WWWOWN}:${WWWGRP} %D/${WWWDIR_REL}/logs' \
		>> ${TMPPLIST}
	@${ECHO_CMD} '@postexec chown ${WWWOWN}:${WWWGRP} %D/${WWWDIR_REL}/temp' \
		>> ${TMPPLIST}

do-install-NSC-on:
	@${INSTALL_DATA} ${FILESDIR}/spellchecker.php ${FAKE_DESTDIR}${WWWDIR}
	@${ECHO_CMD} '${WWWDIR_REL}/spellchecker.php' >> ${TMPPLIST}

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${FAKE_DESTDIR}${DOCSDIR}/
.endfor

do-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKDIR}/newsyslog.conf ${FAKE_DESTDIR}${EXAMPLESDIR}
	@${ECHO_CMD} '@dir etc/newsyslog.conf.d' \
		>> ${TMPPLIST}
	@${ECHO_CMD} '@sample ${EXAMPLESDIR}/newsyslog.conf etc/newsyslog.conf.d/roundcube.conf' \
		>> ${TMPPLIST}

.include <bsd.port.mk>
