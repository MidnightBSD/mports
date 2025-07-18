PORTNAME=	fuglu
PORTVERSION=	1.4.0
CATEGORIES=	mail python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mail scanning daemon for Postfix written in Python
WWW=		https://fuglu.org/

LICENSE=	Apache-2.0

RUN_DEPENDS=	postfix:mail/postfix \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rarfile>0:archivers/py-rarfile@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}lzma>0:archivers/py-lzma@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils

USE_RC_SUBR=	fuglu

NO_ARCH=	yes

LOGDIR=		/var/log/fuglu
PLIST_DIRS+=	${LOGDIR}

OPTIONS_DEFINE=		BEAUTIFULSOUP CLAMAV DKIM MAGIC SPAMASSASSIN SPF SQL
OPTIONS_DEFAULT=	BEAUTIFULSOUP CLAMAV DKIM MAGIC SPAMASSASSIN SPF

BEAUTIFULSOUP_DESC=	Use BeautifulSoup for improved html processing
CLAMAV_DESC=		Use ClamAV
DKIM_DESC=		Use DKIM (in FuGlu)
MAGIC_DESC=		Use mime magic bindings for attachment detection
SPAMASSASSIN_DESC=	Use SpamAssassin
SPF_DESC=		Use SPF (in FuGlu)
SQL_DESC=		Use SQL

BEAUTIFULSOUP_RUN_DEPENDS=	${PYTHON_SITELIBDIR}/bs4/__init__.py:www/py-beautifulsoup@${PY_FLAVOR}
CLAMAV_RUN_DEPENDS=	clamd:security/clamav
DKIM_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dkimpy>0:mail/py-dkimpy@${PY_FLAVOR}
MAGIC_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}magic>0:devel/py-magic@${PY_FLAVOR}
SPAMASSASSIN_RUN_DEPENDS=	spamassassin>=0:mail/spamassassin
SPF_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyspf>0:mail/py-pyspf@${PY_FLAVOR}
SQL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlalchemy10>=1.0:databases/py-sqlalchemy10@${PY_FLAVOR}

post-extract:
	@${REINPLACE_CMD} -e "s|'/etc|'etc|g" ${WRKSRC}/setup.py
	@${REINPLACE_CMD} -e "s|=/etc|=${PREFIX}/etc|g" ${WRKSRC}/conf/fuglu.conf.dist
	@${REINPLACE_CMD} -e "s|'/etc|'${PREFIX}/etc|g" \
		${WRKSRC}/compareconfig.py \
		${WRKSRC}/src/fuglu/plugins/archive.py \
		${WRKSRC}/src/fuglu/plugins/attachment.py \
		${WRKSRC}/src/fuglu/plugins/domainauth.py \
		${WRKSRC}/src/fuglu/plugins/p_fraction.py \
		${WRKSRC}/src/fuglu/plugins/p_skipper.py \
		${WRKSRC}/src/fuglu/plugins/script.py \
		${WRKSRC}/src/startscript/fuglu \
		${WRKSRC}/src/tools/fuglu_conf \
		${WRKSRC}/src/tools/fuglu_debug

post-install:
	@${MKDIR} ${STAGEDIR}${LOGDIR}

.include <bsd.port.mk>
