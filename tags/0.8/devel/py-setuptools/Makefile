# $MidnightBSD$

PORTNAME=	setuptools
PORTVERSION=	17.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	python

MAINTAINER=	python@MidnightBSD.org
COMMENT=	Python packages installer

LICENSE=	python

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist concurrent distutils

PYDISTUTILS_SETUP=	${PYSETUP}

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}distribute-[0-9]*
MAKE_ENV+=		SETUPTOOLS_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=1
PLIST_SUB=		EASYINSTALL_PTH=${PYTHON_SITELIBDIR}/easy-install.pth

.include <bsd.port.pre.mk>

.if ${PYTHON_VERSION} != ${PYTHON_DEFAULT_VERSION}
SUB_FILES+=	pkg-message
SUB_LIST+=	PYTHON_VER=${PYTHON_VER}
.endif

post-install:
	${INSTALL_DATA} ${FILESDIR}/easy-install.pth.dist ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/

regression-test: build
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.post.mk>
