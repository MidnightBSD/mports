PORTNAME=	setuptools
PORTVERSION=	44.1.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	44
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python packages installer

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe python:2.7 zip
USE_PYTHON=	allflavors autoplist concurrent distutils
CPE_VENDOR=	python

MAKE_ENV+=	SETUPTOOLS_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=1
NO_ARCH=	yes
NO_TEST=	yes
PYDISTUTILS_SETUP=	${PYSETUP}

PLIST_FILES=	"@sample %%PYTHON_SITELIBDIR%%/easy-install.pth.dist %%PYTHON_SITELIBDIR%%/easy-install.pth"

.include <bsd.port.pre.mk>

.if ${FLAVOR} != ${FLAVORS:[1]}
SUB_FILES+=	pkg-message
SUB_LIST+=	PYTHON_VER=${PYTHON_VER}
.endif

# These create dependency loops in redports/poudriere, because setuptools
# is currently an explicit BUILD & RUN dependency in Uses/python.mk.
#TEST_DEPENDS=  ${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR}
#.if ${PYTHON_REL} < 30300
#TEST_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}mock>0:devel/py-mock@${PY_FLAVOR}
#.endif
# pkg install -y py36-pytest py36-mock py36-pytest-fixture-config py36-pytest-virtualenv py36-paver

post-install:
	${INSTALL_DATA} ${FILESDIR}/easy-install.pth.dist ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/

.include <bsd.port.post.mk>
