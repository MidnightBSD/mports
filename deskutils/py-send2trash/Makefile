PORTNAME=	send2trash
PORTVERSION=	1.8.3
PORTREVISION=	1
CATEGORIES=	deskutils python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Send2Trash-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small package that sends files to the Trash
WWW=		https://github.com/arsenetar/send2trash

LICENSE=	bsd3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=40.6.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		dos2unix python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

# The wheel is built with the original capitalization Send2Trash, not send2trash
PEP517_INSTALL_CMD=	${PYTHON_CMD} -m installer --destdir ${FAKE_DESTDIR} --prefix ${TRUE_PREFIX} ${BUILD_WRKSRC}/dist/Send2Trash-${DISTVERSION}*.whl

.include <bsd.port.mk>
