PORTNAME=	diffoscope
PORTVERSION=	339
CATEGORIES=	sysutils python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	In-depth comparison of files, archives, and directories
WWW=		https://diffoscope.org/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	gdiff:textproc/diffutils \
		${PYTHON_PKGNAMEPREFIX}libarchive-c>=0:archivers/py-libarchive-c@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-magic>=0:devel/py-python-magic@${PY_FLAVOR}
TEST_DEPENDS=	isoinfo:sysutils/cdrkit \
		rpm2cpio:archivers/rpm2cpio \
		zipinfo:archivers/unzip

USES=		cpe python
CPE_VENDOR=	reproducible_builds
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
