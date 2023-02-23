PORTNAME=	setuptools
PORTVERSION=	63.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python packages installer
WWW=		https://pypi.org/project/setuptools/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe python:3.7+
USE_PYTHON=	allflavors autoplist concurrent distutils

CPE_VENDOR=	python

MAKE_ENV+=	SETUPTOOLS_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=1
NO_ARCH=	yes
PYDISTUTILS_SETUP=	${PYSETUP}

PLIST_FILES=	"@sample %%PYTHON_SITELIBDIR%%/easy-install.pth.dist %%PYTHON_SITELIBDIR%%/easy-install.pth"

.include <bsd.port.pre.mk>

.if ${FLAVOR} != ${FLAVORS:[1]}
SUB_FILES+=	pkg-message
SUB_LIST+=	PYTHON_VER=${PYTHON_VER}
.endif

NO_TEST= yes

post-install:
	${INSTALL_DATA} ${FILESDIR}/easy-install.pth.dist ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/

#do-test:
#	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.post.mk>
