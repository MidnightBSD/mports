PORTNAME=	fonttools
PORTVERSION=	4.65.0
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open source library for manipulating fonts, written in Python
WWW=		https://github.com/fonttools/fonttools

LICENSE=	Apache-2.0 OFL11 bsd3 mit
LICENSE_COMB=	multi
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE.external
LICENSE_FILE_OFL11=	${WRKSRC}/LICENSE.external
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.external
LICENSE_FILE_mit=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent cython pep517

NO_TEST=	yes

OPTIONS_DEFINE=		GRAPHITE INTERPOLATABLE LXML PLOT REPACKER SYMFONT \
			UNICODE WOFF
OPTIONS_DEFAULT=	LXML UNICODE WOFF
GRAPHITE_DESC=		Process graphite type tables in ttLib/tables
INTERPOLATABLE_DESC=	Interpolatability support
LXML_DESC=		Read/write XML files via lxml (faster/safer than built-in ElementTree)
PLOT_DESC=		Visualize DesignSpaceDocument and resulting VariationModel
REPACKER_DESC=		Pack GSUB/GPOS tables with harfbuzz repacker
SYMFONT_DESC=		Symbolic font statistics analysis
UNICODE_DESC=		Use latest Unicode Character Database
WOFF_DESC=		Compress/uncompress WOFF webfonts

GRAPHITE_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}lz4>=1.7.4.2:archivers/py-lz4@${PY_FLAVOR}
INTERPOLATABLE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cairo>=0:graphics/py-cairo@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}scipy>=0,1:science/py-scipy@${PY_FLAVOR}
LXML_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}lxml>=4.0:devel/py-lxml@${PY_FLAVOR}
PLOT_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}matplotlib>=0:math/py-matplotlib@${PY_FLAVOR}
REPACKER_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}uharfbuzz>=0.45.0:print/py-uharfbuzz@${PY_FLAVOR}
SYMFONT_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}sympy>=0:math/py-sympy@${PY_FLAVOR}
WOFF_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}brotli>=1.0.1:archivers/py-brotli@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}zopfli>=0.1.4:archivers/py-zopfli@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MUNICODE} && ${PYTHON_REL} < 31500
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}unicodedata2>=17.0.0:devel/py-unicodedata2@${PY_FLAVOR}
.endif

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.post.mk>
