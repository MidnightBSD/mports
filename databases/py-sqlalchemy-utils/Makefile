PORTNAME=	sqlalchemy-utils
PORTVERSION=	0.41.2
PORTREVISION=	2
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	SQLAlchemy-Utils-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Various utility functions for SQLAlchemy
WWW=		https://github.com/kvesteri/sqlalchemy-utils

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	ARROW BABEL COLOR ENCRYPTED INTERVALS PASSWORD PENDULUM PHONE TIMEZONE URL
OPTIONS_RADIO=	SQLALCHEMY
OPTIONS_RADIO_SQLALCHEMY=	SQLALCHEMY14 SQLALCHEMY20
OPTIONS_DEFAULT=SQLALCHEMY20
ARROW_DESC=	Arrow type support
BABEL_DESC=	Babel locale type support
COLOR_DESC=	Color type support
ENCRYPTED_DESC=	Encrypted type support
INTERVALS_DESC=	Interval operators support
PASSWORD_DESC=	Password type support
PENDULUM_DESC=	Pendulum Date/DateTime support
PHONE_DESC=	Phone number type support
SQLALCHEMY14_DESC=	Use SQLAlchemy 1.4.*
SQLALCHEMY20_DESC=	Use SQLAlchemy 2.0.*
TIMEZONE_DESC=	Timezone support
URL_DESC=	URL type support

ARROW_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}arrow>=0.3.4:devel/py-arrow@${PY_FLAVOR}
BABEL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Babel>=1.3:devel/py-babel@${PY_FLAVOR}
COLOR_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}colour>=0.0.4:graphics/py-colour@${PY_FLAVOR}
ENCRYPTED_USE=		PYTHON=cryptography
INTERVALS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}intervals>=0.7.1:devel/py-intervals@${PY_FLAVOR}
PASSWORD_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}passlib>=1.6<2.0:security/py-passlib@${PY_FLAVOR}
PENDULUM_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pendulum>=2.0.5:devel/py-pendulum@${PY_FLAVOR}
PHONE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}phonenumbers>=5.9.2:devel/py-phonenumbers@${PY_FLAVOR}
SQLALCHEMY14_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlalchemy14>=1.3:databases/py-sqlalchemy14@${PY_FLAVOR}
SQLALCHEMY20_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlalchemy20>=1.3:databases/py-sqlalchemy20@${PY_FLAVOR}
TIMEZONE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-dateutil>=0:devel/py-python-dateutil@${PY_FLAVOR}
URL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}furl>=0.4.1:devel/py-furl@${PY_FLAVOR}

.include <bsd.port.mk>
