PORTNAME=	certbot
PORTVERSION=	${ACME_VERSION}
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	security python
MASTER_SITES=	PYPI \
		https://github.com/certbot/certbot/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Let's Encrypt client #'
WWW=		https://certbot.eff.org/ \
		https://github.com/certbot/certbot \
		https://github.com/certbot/certbot/tree/master/certbot

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}acme>=${ACME_VERSION},1:security/py-acme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}configargparse>=1.5.3:devel/py-configargparse@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}configobj>=5.0.6:devel/py-configobj@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}distro>=1.0.1:sysutils/py-distro@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}josepy>=2.0.0:security/py-josepy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}parsedatetime>=2.4:devel/py-parsedatetime@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyrfc3339>=0:devel/py-pyrfc3339@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytz>=2019.3,1:devel/py-pytz@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=41.6.0:devel/py-setuptools@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent cryptography pep517

NO_TEST=	yes
NO_ARCH=	yes

PLIST_FILES=	etc/periodic/weekly/500.certbot-${PYTHON_VER}
SUB_FILES=	500.certbot pkg-message
SUB_LIST=	PYTHON_VER=${PYTHON_VER}

OPTIONS_DEFINE=	MANPAGES
OPTIONS_DEFAULT=MANPAGES

MANPAGES_BUILD_DEPENDS=	${RUN_DEPENDS} \
			${PYTHON_PKGNAMEPREFIX}sphinx>=1.2,1:textproc/py-sphinx@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx_rtd_theme>=0:textproc/py-sphinx_rtd_theme@${PY_FLAVOR}
MANPAGES_PLIST_FILES=	share/man/man1/certbot.1.gz \
			share/man/man7/certbot.7.gz

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=4.6:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|'  -e 's|freebsd|midnightbsd|g' \
		${WRKSRC}/certbot/compat/misc.py \
		${WRKSRC}/certbot/_internal/tests/cli_test.py \
		${WRKSRC}/certbot/util.py

post-build-MANPAGES-on:
	# Avoid gmake / ${DO_MAKE_BUILD} -C ${WRKSRC}/docs man
	cd ${WRKSRC}/docs && sphinx-build-${PYTHON_VER} -N -b man . _build/man

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/periodic/weekly
	${INSTALL_SCRIPT} ${WRKDIR}/500.certbot ${STAGEDIR}${PREFIX}/etc/periodic/weekly/500.certbot-${PYTHON_VER}

post-install-MANPAGES-on:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/man/man1 ${FAKE_DESTDIR}${PREFIX}/share/man/man7
	${INSTALL_MAN} ${WRKSRC}/docs/_build/man/certbot.1 \
		${FAKE_DESTDIR}${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/docs/_build/man/certbot.7 \
		${FAKE_DESTDIR}${PREFIX}/share/man/man7

.include "${.CURDIR}/../py-acme/version.mk"
.include <bsd.port.post.mk>
