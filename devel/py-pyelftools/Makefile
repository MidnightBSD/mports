PORTNAME=	pyelftools
PORTVERSION=	0.33
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for analyzing ELF files and DWARF debugging information
WWW=		https://github.com/eliben/pyelftools

LICENSE=	unlicense mit
LICENSE_COMB=	multi
LICENSE_FILE_unlicense=	${WRKSRC}/LICENSE
LICENSE_FILE_mit=	${FILESDIR}/LICENSE.construct

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=46.4.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

NO_ARCH=	yes
STRIP=
USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
