PORTNAME=	rpds-py
PORTVERSION=	0.13.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/crate-py/rpds/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	rpds_py-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings to Rust persistent data structures (rpds)
WWW=		https://github.com/crate-py/rpds

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}maturin>=1<2:devel/py-maturin@${PY_FLAVOR}

USES=		cargo dos2unix python
USE_PYTHON=	autoplist concurrent pep517

CARGO_BUILD=	no
CARGO_INSTALL=	no
WRKSRC=		${WRKDIR}/rpds_py-${PORTVERSION}

NO_TEST=	yes

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

do-test:
	${NOOP}

.include <bsd.port.mk>
