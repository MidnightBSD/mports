PORTNAME=	pendulum
PORTVERSION=	3.3.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python package to ease datetimes manipulation
WWW=		https://pendulum.eustace.io

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}maturin>=1.0<2.0:devel/py-maturin@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-dateutil>=2.6:devel/py-python-dateutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tzdata>=2020.1:devel/py-tzdata@${PY_FLAVOR}

USES=		cargo python:3.10+
USE_PYTHON=	autoplist concurrent pep517

CARGO_BUILD=	no
CARGO_CARGOLOCK=	${WRKSRC}/rust/Cargo.lock
CARGO_CARGOTOML=	${WRKSRC}/rust/Cargo.toml
CARGO_INSTALL=	no

MAKE_ENV=	${CARGO_ENV}

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/pendulum/_pendulum*.so

.include <bsd.port.mk>
