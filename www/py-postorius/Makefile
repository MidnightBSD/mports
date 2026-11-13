PORTNAME=	postorius
PORTVERSION=	1.3.13
CATEGORIES=	www
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

PATCH_SITES=	https://gitlab.com/mailman/postorius/-/commit/
PATCHFILES=	c4706abd05ba6bcf472fc674b160d3a9d6a4868b.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web user interface for GNU Mailman
WWW=		https://docs.mailman3.org/projects/postorius/en/latest/ \
		https://gitlab.com/mailman/postorius

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>=0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}django-mailman3>=1.3.13:mail/py-django-mailman3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}django42>=4.2<5.1:www/py-django42@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mailmanclient>=3.3.3:mail/py-mailmanclient@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}readme-renderer>=0:devel/py-readme-renderer@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}beautifulsoup>=0:www/py-beautifulsoup@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}django-debug-toolbar44>=4.4.6:www/py-django-debug-toolbar44@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}django-requests-debug-toolbar007>=0.0.7:www/py-django-requests-debug-toolbar007@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}isort>=0:devel/py-isort@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mailman>=3.3.1:mail/mailman3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=7,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-django>=4.11<4.12:devel/py-pytest-django@${PY_FLAVOR}

USES=		cpe python shebangfix
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

CPE_VENDOR=	postorius_project

SHEBANG_FILES=	example_project/manage.py

OPTIONS_DEFINE=	EXAMPLES

post-patch:
# https://gitlab.com/mailman/postorius/-/commit/c4706abd05ba6bcf472fc674b160d3a9d6a4868b
	@${RM} ${WRKSRC}/src/postorius/doc/news.rst.orig
	@${RM} ${WRKSRC}/src/postorius/static/postorius/js/held_messages.js.orig

do-test:
	cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${TEST_ENV} \
		PYTHONPATH=${PYTHONPREFIX_LIBDIR}/mports-django-debug-toolbar/44:${PYTHONPREFIX_LIBDIR}/mports-django-requests-debug-toolbar/007 \
		${PYTHON_CMD} -m pytest src/

post-install-EXAMPLES-on:
	cd ${WRKSRC} && ${COPYTREE_SHARE} example_project ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
