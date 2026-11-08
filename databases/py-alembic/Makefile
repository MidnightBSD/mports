PORTNAME=	alembic
DISTVERSION=	1.18.2
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database migration tool for SQLAlchemy
WWW=		https://alembic.zzzcomputing.com/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

RUN_DEPENDS=	${PY_TOMLI} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.12:devel/py-typing-extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mako>=0:textproc/py-mako@${PY_FLAVOR}

#TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR} \
#		${PYTHON_PKGNAMEPREFIX}tox>0:devel/py-tox@${PY_FLAVOR}

CONFLICTS_INSTALL=	py*-alembic* # lib/python3.8/site-packages/alembic/__init__.py'

OPTIONS_RADIO=	SQLALCHEMY
OPTIONS_RADIO_SQLALCHEMY=	SQLALCHEMY14 SQLALCHEMY20
OPTIONS_DEFAULT=	SQLALCHEMY20

SQLALCHEMY_DESC=	SQLAlchemy version
SQLALCHEMY14_DESC=	Use SQLAlchemy 1.4
SQLALCHEMY20_DESC=	Use SQLAlchemy 2.0
SQLALCHEMY14_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlalchemy14>=1.4.0:databases/py-sqlalchemy14@${PY_FLAVOR}
SQLALCHEMY20_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlalchemy20>=2.0.0:databases/py-sqlalchemy20@${PY_FLAVOR}

NO_ARCH=	yes
NO_TEST=	yes

#do-test:
#	@cd ${WRKSRC} && ${LOCALBASE}/bin/tox -e ${PY_FLAVOR}

.include <bsd.port.mk>
