PORTNAME=	cheetah
DISTVERSION=	3.2.6
CATEGORIES=	devel textproc www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	3
DISTNAME=	Cheetah3-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTML template engine for Python
WWW=		https://cheetahtemplate.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}markdown>=2.0.3:textproc/py-markdown@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/Cheetah/*.so

.include <bsd.port.mk>
