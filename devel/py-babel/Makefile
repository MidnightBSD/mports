PORTNAME=	Babel
DISTVERSION=	2.16.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
DISTNAME=	babel-${DISTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of tools for internationalizing Python applications
WWW=		https://babel.pocoo.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}freezegun>0:devel/py-freezegun@${PY_FLAVOR}

USES=		cpe python
CPE_VENDOR=	pocoo
USE_PYTHON=	autoplist concurrent distutils pytest

NO_ARCH=	yes
PORTDOCS=	docs/*

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 30900
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}pytz>=2015.7:devel/py-pytz@${PY_FLAVOR}
.endif

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for docfile in ${PORTDOCS}
	${CP} -r ${WRKSRC}/${docfile} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.post.mk>
