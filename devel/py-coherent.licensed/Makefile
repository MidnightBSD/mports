PORTNAME=	coherent.licensed
DISTVERSION=	0.5.2
CATEGORIES=	devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/./_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Inject a license file at build time
WWW=		https://github.com/coherent-oss/coherent.licensed

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.11:devel/py-flit-core@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist pep517

PEP517_INSTALL_CMD=	${PYTHON_CMD} -m installer --destdir ${FAKE_DESTDIR} \
		--prefix ${TRUE_PREFIX} \
		${BUILD_WRKSRC}/dist/${PORTNAME:tl:C|[-_.]+|_|g}-${DISTVERSION}*.whl

NO_ARCH=	yes

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
	@cd ${INSTALL_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PEP517_INSTALL_CMD}
	@${PYTHON_CMD} -B ${PORTSDIR}/Mk/scripts/strip_RECORD.py \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/coherent_licensed-${DISTVERSION}*.dist-info/RECORD >> ${_PYTHONPKGLIST}
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
