PORTNAME=	wheel
PORTVERSION=	0.44.0
CATEGORIES=	devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	044

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Built-package format for Python
WWW=		https://github.com/pypa/wheel

LICENSE=	mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.8:devel/py-flit-core@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

PORTSCOUT=	ignore:1

EXTRACT_CMD=	${SETENV} LC_ALL=en_US.UTF-8 /usr/bin/bsdtar
NO_ARCH=	yes

post-fake:
# move everything under setuptools vendor directory
	${MKDIR} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/setuptools/_vendor
	${MV} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${PORTNAME:C|[-_]+|_|g}-${DISTVERSION}*.dist-info \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${PORTNAME:C|[-_]+|_|g} \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/setuptools/_vendor
	${REINPLACE_CMD} -e 's|${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/${PORTNAME:C|[-_]+|_|g}|${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/setuptools/_vendor/${PORTNAME:C|[-_]+|_|g}|g' \
		-e 's|bin/|@comment bin/|' \
		${_PYTHONPKGLIST}
# add .pth so setuptools build knows we exist
	${ECHO_CMD} setuptools/_vendor > ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${PORTNAME}${PKGNAMESUFFIX}.pth
	${ECHO_CMD} ${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/${PORTNAME}${PKGNAMESUFFIX}.pth >> ${_PYTHONPKGLIST}

.include <bsd.port.mk>
