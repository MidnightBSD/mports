PORTNAME=	ansible-compat
PORTVERSION=	4.1.2
CATEGORIES=	sysutils python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ansible compatibility goodies
WWW=		https://github.com/ansible-community/ansible-compat

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}setuptools_scm7>=7.0.0:devel/py-setuptools_scm7@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ansible-core>=2.12:sysutils/py-ansible-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}yaml>0:devel/py-yaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}subprocess-tee>=0.4.1:devel/py-subprocess-tee@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema>=4.6.0:devel/py-jsonschema@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.5.0:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
