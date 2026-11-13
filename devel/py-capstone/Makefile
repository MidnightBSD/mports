PORTNAME=	capstone
DISTVERSION=	5.0.9
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	python # Conflicts with devel/capstone distfile

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the Capstone Disassembly Engine
WWW=		https://www.capstone-engine.org

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.TXT

LIB_DEPENDS=	libcapstone.so:devel/capstone

USES=		cpe python:3.8+
CPE_VENDOR=	${PORTNAME}-engine
USE_PYTHON=	autoplist pep517
MAKE_ENV+=	LIBCAPSTONE_PATH= # Prevent bundled libcapstone from being built

NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/capstone/__init__.py

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

do-test:
	cd ${WRKSRC}/tests && for test in test_*.py; do \
		${SETENVI} ${WRK_ENV} ${TEST_ENV} \
			PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
			${PYTHON_CMD} $$test || exit $$?; \
	done

.include <bsd.port.mk>
