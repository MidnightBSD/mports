PORTNAME=	path.py
PORTVERSION=	11.5.2
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module wrapper for os.path
WWW=		https://github.com/jaraco/path.py

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=0.5:devel/py-importlib-metadata@${PY_FLAVOR}

NO_ARCH=	yes
USES=		python
USE_GITHUB=	yes
USE_PYTHON=	autoplist distutils
GH_ACCOUNT=	jaraco
PORTSCOUT=	limit:^11\. # ignore py3-only for now
NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e '/setuptools_scm/d' \
		-e 's/use_scm_version=True/version="${PORTVERSION}"/' \
		${WRKSRC}/setup.*

.include <bsd.port.mk>
