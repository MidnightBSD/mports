PORTNAME=	editorconfig
PORTVERSION=	0.12.4
CATEGORIES=	editors python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	EditorConfig-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	EditorConfig File Locator and Interpreter for Python
WWW=		https://editorconfig.org/

LICENSE=	bsd2 python
LICENSE_COMB=	multi

USES=		python
USE_PYTHON=	autoplist distutils

# files/patch-setup.cfg drops the "editorconfig" console script, which
# collided with editors/editorconfig-core-c and between flavors.  The CLI
# is still available by running the module (-m editorconfig).

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=42.2:devel/py-setuptools@${PY_FLAVOR}

.include <bsd.port.mk>
