PORTNAME=	matplotlib
DISTVERSION=	3.11.1
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plotting library uses a syntax familiar to MATLAB users
WWW=		https://matplotlib.org/

LICENSE=	Matplotlib
LICENSE_NAME=	Matplotlib license
LICENSE_FILE=	${WRKSRC}/LICENSE/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}meson-python>=0.13.2:devel/meson-python@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pybind11>=2.13.2:devel/py-pybind11@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm9>=9.2.2<10:devel/py-setuptools-scm9@${PY_FLAVOR}
BUILD_RUN_DEPENDS=	libraqm>=0.10.4:print/libraqm
LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libpng.so:graphics/png \
		libqhull_r.so:math/qhull \
		libraqm.so:print/libraqm
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tkinter>0:x11-toolkits/py-tkinter@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}contourpy>=1.0.1:math/py-contourpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cycler>=0.10:devel/py-cycler@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fonttools>=4.28.2:print/py-fonttools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}kiwisolver>=1.3.1,1:math/py-kiwisolver@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>=1.25,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=20.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pillow>=9:graphics/py-pillow@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyparsing>=3:devel/py-pyparsing@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-dateutil>=2.7:devel/py-python-dateutil@${PY_FLAVOR}

USES=			compiler:c++17-lang gettext gnome localbase \
				pkgconfig python:3.11+ shebangfix uniquefiles:dirs
USE_CXXSTD=			c++17
USE_PYTHON=			autoplist pep517
PEP517_BUILD_CONFIG_SETTING=	-Csetup-args="-Dsystem-freetype=true" \
				-Csetup-args="-Dsystem-libraqm=true" \
				-Csetup-args="-Dsystem-qhull=true" \
				-Csetup-args="-DrcParams-backend=TkAgg"

_SETUPTOOLS_SCM_PRIVATE?=	${PYTHONPREFIX_LIBDIR}/mports-setuptools-scm/9
MAKE_ENV+=			PYTHONPATH=${_SETUPTOOLS_SCM_PRIVATE}

LDFLAGS+=	-fuse-ld=lld

BINARY_ALIAS=	pybind11-config=pybind11-config-${PYTHON_VER}

PLIST_SUB=	VER=${PORTVERSION}
PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

post-extract:
	@${FIND} ${WRKSRC} -name '*.py' | \
		${XARGS} ${CHMOD} -x

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/matplotlib -name '*.so' | \
		${XARGS} ${STRIP_CMD}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${CP} -R ${WRKSRC}/galleries/examples/ ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
