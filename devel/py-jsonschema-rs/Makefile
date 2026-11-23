PORTNAME=	jsonschema-rs
PORTVERSION=	0.61.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance JSON Schema validator for Python
WWW=		https://github.com/Stranger6667/jsonschema/tree/master/crates/jsonschema-py \
		https://github.com/Stranger6667/jsonschema

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/crates/jsonschema/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}maturin>=1.0<2.0:devel/py-maturin@${PY_FLAVOR}

USES=		cargo python
USE_PYTHON=	autoplist concurrent pep517

CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no

.include <bsd.port.mk>
