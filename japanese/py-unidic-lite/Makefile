PORTNAME=	unidic-lite
DISTVERSION=	1.0.8
CATEGORIES=	japanese python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small UniDic 2.1.2 dictionary distribution for Python
WWW=		https://github.com/polm/unidic-lite

LICENSE=	mit bsd3
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.unidic

TEST_DEPENDS=	mecab:japanese/mecab

USES=		python:3.9+
USE_PYTHON=	distutils autoplist

NO_ARCH=	yes

do-test:
	${SETENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		${PYTHON_CMD} ${FILESDIR}/test-dictionary.py \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} ${LOCALBASE}/bin/mecab

.include <bsd.port.mk>
