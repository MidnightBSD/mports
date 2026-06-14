PORTNAME=	libsass
DISTVERSION=	0.23.0
PORTREVISION=	2
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Straightforward binding of libsass for Python
WWW=		https://pypi.org/project/libsass/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libsass.so:textproc/libsass

USES=		compiler:c++11-lang localbase python
USE_PYTHON=	distutils autoplist pytest

# Keep the Python extension on the base C++ runtime to match textproc/libsass.
MAKE_ENV=	SYSTEM_SASS=1

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/_sass.abi3.so

.include <bsd.port.mk>
