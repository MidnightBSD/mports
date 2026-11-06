PORTNAME=	usb
PORTVERSION=	1.3.1
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper around libusb

LICENSE=	bsd3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=30.3.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>0:devel/py-setuptools-scm@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

USE_GITHUB=	yes
GH_ACCOUNT=	pyusb
GH_PROJECT=	py${PORTNAME}
GH_TAGNAME=	v${PORTVERSION}

MAKE_ENV=	SETUPTOOLS_SCM_PRETEND_VERSION=${PORTVERSION}
NO_ARCH=	yes

PORTDOCS=	*.rst

OPTIONS_DEFINE=	DOCS

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/docs/,} ${FAKE_DESTDIR}${DOCSDIR}

do-test:
	@(cd ${WRKSRC}/tests && ${PYTHON_CMD} testall.py)

.include <bsd.port.mk>
