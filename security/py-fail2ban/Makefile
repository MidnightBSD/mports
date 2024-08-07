PORTNAME=	fail2ban
PORTVERSION=	1.1.0
CATEGORIES=	security python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scans log files and bans IP that makes too many password failures
WWW=		https://www.fail2ban.org/wiki/index.php/Main_Page

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR}

USES=		cpe python:patch,run shebangfix
USE_GITHUB=	yes
USE_PYTHON=	autoplist distutils
USE_RC_SUBR=	fail2ban

NO_ARCH=	yes
NO_TEST=	yes

SHEBANG_FILES=	config/filter.d/ignorecommands/apache-fakegooglebot
SHEBANG_LANG=	fail2ban-python

SUB_LIST+=	PYTHON_CMD=${PYTHON_CMD}

PYDISTUTILS_BUILDARGS+=		--without-tests
PYDISTUTILS_INSTALLARGS+=	--install-data=${ETCDIR}

PORTDOCS=	README.md DEVELOP

OPTIONS_DEFINE=	DOCS INOTIFY
OPTIONS_DEFAULT=INOTIFY

INOTIFY_DESC=		Support for (lib)inotify to monitor filesystem changes

INOTIFY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyinotify>=0.8.3:devel/py-pyinotify@${PY_FLAVOR}

FILES=		${WRKSRC}/bin/fail2ban-client \
		${WRKSRC}/fail2ban/client/configreader.py \
		${WRKSRC}/fail2ban/client/fail2bancmdline.py \
		${WRKSRC}/fail2ban/client/fail2banregex.py \
		${WRKSRC}/man/fail2ban-client.1 \
		${WRKSRC}/man/fail2ban-client.h2m \
		${WRKSRC}/setup.py

MAN_FILES=	${WRKSRC}/man/fail2ban-client.1 \
		${WRKSRC}/man/fail2ban-client.h2m \
		${WRKSRC}/man/fail2ban-regex.1 \
		${WRKSRC}/man/fail2ban-server.1 \
		${WRKSRC}/man/fail2ban.1

FAIL2BAN_DBDIR=	/var/db/${PORTNAME}

PY2TO3_CMD=	${LOCALBASE}/bin/2to3-${PYTHON_VER}
PY2TO3_ARG=	--no-diffs --write --nobackups --fix=all

post-patch:
	@${REINPLACE_CMD} -e 's,/etc/fail2ban,${ETCDIR},g' ${FILES}
	@${REINPLACE_CMD} -e 's,paths-debian.conf,paths-freebsd.conf,g' \
		${WRKSRC}/config/jail.conf
	@${REINPLACE_CMD} -e 's,/var/lib/fail2ban/,${FAIL2BAN_DBDIR}/,g' \
		${WRKSRC}/config/fail2ban.conf
	@${REINPLACE_CMD} -e 's,jail.conf(5),fail2ban-jail.conf(5),g' \
		${MAN_FILES}
	@${REINPLACE_CMD} -e 's, sed , ${SED} ,g' \
		${WRKSRC}/config/action.d/hostsdeny.conf

	(cd ${WRKSRC}/ && ${PY2TO3_CMD} ${PY2TO3_ARG} bin/* fail2ban)

post-install:
	@${MKDIR} ${FAKE_DESTDIR}${FAIL2BAN_DBDIR} ${FAKE_DESTDIR}/var/run/fail2ban
.for file in fail2ban-client fail2ban-regex fail2ban-server fail2ban
	${INSTALL_MAN} ${WRKSRC}/man/${file}.1 ${STAGEDIR}${PREFIX}/share/man/man1
.endfor
	${INSTALL_MAN} ${WRKSRC}/man/jail.conf.5 ${STAGEDIR}${PREFIX}/share/man/man5/fail2ban-jail.conf.5

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR})


.include <bsd.port.mk>
