PORTNAME=	pyftpdlib
PORTVERSION=	1.5.10
CATEGORIES=	ftp python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python FTP server library
WWW=		https://github.com/giampaolo/pyftpdlib

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyopenssl>0:security/py-pyopenssl@${PY_FLAVOR}

USES=		python shebangfix
USE_PYTHON=	autoplist distutils
SHEBANG_FILES=	demo/*.py
NO_ARCH=	yes

OPTIONS_DEFINE=		SENDFILE OPENSSL EXAMPLES
OPTIONS_DEFAULT=	SENDFILE OPENSSL
SENDFILE_DESC=		Enable sendfile(2) support
OPENSSL_DESC=		Enable FTP over SSL/TLS (RFC4217)

SENDFILE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pysendfile>0:net/py-pysendfile@${PY_FLAVOR}
OPENSSL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyopenssl>0:security/py-pyopenssl@${PY_FLAVOR}

EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}
PORTEXAMPLES=	*

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${CP} -R ${WRKSRC}/demo/ ${EXAMPLESDIR}

TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

do-test:
	@cd ${WRKDIR} && ${SETENV} ${TEST_ENV} \
		PYTHONDONTWRITEBYTECODE=1 ${PYTHON_CMD} -m pytest -v ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/pyftpdlib/test

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} >= 31200
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}pyasyncore>=1.0.5:devel/py-pyasyncore@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyasynchat>=1.0.5:devel/py-pyasynchat@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
