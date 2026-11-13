PORTNAME=	flufl.lock
DISTVERSION=	9.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:C|[-_.]+|_|g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NFS-safe file locking with timeouts for POSIX systems
WWW=		https://flufllock.readthedocs.io

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}atpublic>=0:devel/py-atpublic@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>=0:sysutils/py-psutil@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517

PEP517_INSTALL_CMD=	${PYTHON_CMD} -m installer --destdir ${FAKE_DESTDIR} \
		--prefix ${TRUE_PREFIX} \
		${BUILD_WRKSRC}/dist/${PORTNAME:tl:C|[-_.]+|_|g}-${DISTVERSION}*.whl

NO_ARCH=	yes

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
	@cd ${INSTALL_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PEP517_INSTALL_CMD}
	@${PYTHON_CMD} -B ${PORTSDIR}/Mk/scripts/strip_RECORD.py \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/flufl_lock-${DISTVERSION}*.dist-info/RECORD >> ${_PYTHONPKGLIST}
	@${REINPLACE_CMD} \
		-e '/\.pyc$$/d' \
		-e 's|^|${PYTHONPREFIX_SITELIBDIR}/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../etc/|etc/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../bin/|bin/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../include/|include/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../lib/|lib/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../libdata/|libdata/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../libexec/|libexec/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../man/|man/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../sbin/|sbin/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../share/|share/|' \
			${_PYTHONPKGLIST}
	@cd ${FAKE_DESTDIR}${TRUE_PREFIX} && ${FIND} lib -name '*.pyc' >> ${_PYTHONPKGLIST}

.include <bsd.port.mk>
