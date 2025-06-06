PORTNAME=	borgbackup
DISTVERSION=	1.4.1
PORTREVISION=	0
CATEGORIES=	archivers python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Deduplicating backup program
WWW=		https://pypi.org/project/borgbackup/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

# note that borgbackup pins the msgpack version range per patchlevel version!
_BB_DEPENDS=	${PYTHON_PKGNAMEPREFIX}msgpack>=1.0.3<1.1.1:devel/py-msgpack@${PY_FLAVOR}
BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pkgconfig>=0:devel/py-pkgconfig@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=1.7:devel/py-setuptools-scm@${PY_FLAVOR} \
		${_BB_DEPENDS}
LIB_DEPENDS=	liblz4.so:archivers/liblz4 \
		libzstd.so:archivers/zstd \
		libxxhash.so:devel/xxhash
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=19.0:devel/py-packaging@${PY_FLAVOR} \
		${_BB_DEPENDS}
TEST_DEPENDS=	${RUN_DEPENDS} \
		${PYTHON_PKGNAMEPREFIX}tox>3.2:devel/py-tox@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}virtualenv>=0:devel/py-virtualenv@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		fakeroot:security/fakeroot

USES=		pkgconfig python:3.9+ ssl
USE_PYTHON=	autoplist distutils
MAKE_ENV=	BORG_OPENSSL_PREFIX=${OPENSSLBASE}

NO_TEST=	yes

OPTIONS_DEFINE=		FUSE
OPTIONS_DEFAULT=	FUSE

FUSE_DESC=	Support to mount locally borg backup files
FUSE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}llfuse>0:filesystems/py-llfuse@${PY_FLAVOR}

.include <bsd.port.pre.mk>

EXTRA_PATCHES	+= ${FILESDIR}/extrapatch-setup.py
post-patch:
	${CP} ${FILESDIR}/acl_extended_file_np.c ${WRKSRC}/src/borg/platform/

_BORGHOME=${WRKDIR}/testhome
_BORGENV=-i BORG_PASSPHRASE=secret123 PYTHONPATH=${STAGEDIR}${PYTHON_SITELIBDIR} HOME=${_BORGHOME}
post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/man/man1/
	${INSTALL_MAN} ${WRKSRC}/docs/man/* ${STAGEDIR}${PREFIX}/share/man/man1/
	${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/borg/ -name "*.so" \
		-exec ${STRIP_CMD} {} \;

.include <bsd.port.post.mk>
