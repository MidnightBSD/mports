PORTNAME=	fonttools
PORTVERSION=	3.44.0
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open source library for manipulating fonts, written in Python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python zip
USE_PYTHON=	autoplist concurrent distutils

MAKE_ENV=	FONTTOOLS_MANPATH="man"
NO_ARCH=	yes

PORTSCOUT=	limit:^3\.

OPTIONS_DEFINE=	GRAPHITE INTERPOLATABLE LXML PLOT SYMFONT UFO UNICODE WOFF
OPTIONS_DEFAULT= LXML UFO UNICODE

GRAPHITE_DESC=	Process graphite type tables in ttLib/tables
INTERPOLATABLE_DESC=	Interpolatability support
LXML_DESC=	Read/write XML files via lxml (faster/safer than built-in ElementTree)
PLOT_DESC=	Visualize DesignSpaceDocument and resulting VariationModel
SYMFONT_DESC=	Symbolic font statistics analysis
UFO_DESC=	Read/write UFO fonts
UNICODE_DESC=	Use latest Unicode Character Database
WOFF_DESC=	Compress/uncompress WOFF webfonts

GRAPHITE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lz4>=1.7.4.2:archivers/py-lz4@${PY_FLAVOR}
INTERPOLATABLE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}scipy>=0:science/py-scipy@${PY_FLAVOR}
LXML_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=4.0<5:devel/py-lxml@${PY_FLAVOR}
PLOT_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}matplotlib>=0:math/py-matplotlib@${PY_FLAVOR}
SYMFONT_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sympy>=0:math/py-sympy@${PY_FLAVOR}
UFO_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fs2>=2.2.0<3:filesystems/py-fs2@${PY_FLAVOR}
WOFF_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}brotli>=1.0.1:archivers/py-brotli@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}zopfli>=0.1.4:archivers/py-zopfli@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MUNICODE}
.if ${PYTHON_REL} < 30800
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}unicodedata2>=12.0.0:devel/py-unicodedata2@${PY_FLAVOR}
.endif
.endif

.include <bsd.port.post.mk>
