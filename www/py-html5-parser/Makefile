PORTNAME=	html5-parser
PORTVERSION=	0.4.12
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast implementation of the HTML 5 parsing spec for Python
WWW=		https://html5-parser.readthedocs.io/

LICENSE=	apache2

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=4.9.2:devel/py-lxml@${PY_FLAVOR}

USES=		gnome pkgconfig python
USE_PYTHON=	autoplist distutils
USE_GNOME=	libxml2

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/html5_parser/html_parser*.so

.include <bsd.port.mk>
