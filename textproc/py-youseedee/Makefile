PORTNAME=	youseedee
PORTVERSION=	0.5.3
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface to the Unicode Character Database
WWW=		https://github.com/simoncozens/youseedee

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}filelock>=0:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=0:www/py-requests@${PY_FLAVOR} \
		UCD>=0:textproc/UCD

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|%%UCDDIR%%|${LOCALBASE}/share/unicode/ucd|' ${WRKSRC}/lib/youseedee/__init__.py

.include <bsd.port.mk>
