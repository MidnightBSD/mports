PORTNAME=	cffsubr
PORTVERSION=	0.3.0
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standalone CFF subroutinizer based on the AFDKO tx tool
WWW=		https://github.com/adobe-type-tools/cffsubr

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	tx:x11-fonts/afdko \
		${PYTHON_PKGNAMEPREFIX}afdko>=0:x11-fonts/py-afdko@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fonttools>=4.10.2:print/py-fonttools@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
PLIST_FILES=	${PYTHON_SITELIBDIR}/cffsubr/tx

post-patch:
# Clean up bundled libraries
	@${RM} -r ${WRKSRC}/external/

post-install:
	${LN} -s ${LOCALBASE}/bin/tx ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cffsubr/tx

.include <bsd.port.mk>
