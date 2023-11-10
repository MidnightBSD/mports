PORTNAME=	borgbackup
DISTVERSION=	1.2.6
CATEGORIES=	archivers python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Deduplicating backup program
WWW=		https://pypi.org/project/borgbackup/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

# note that borgbackup pins the msgpack version range per patchlevel version!
_BB_DEPENDS=	${PYTHON_PKGNAMEPREFIX}msgpack>=1.0.2<1.0.7_99:devel/py-msgpack@${PY_FLAVOR}
BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>=1.7:devel/py-setuptools_scm@${PY_FLAVOR} \
		${_BB_DEPENDS}
LIB_DEPENDS=	liblz4.so:archivers/liblz4 \
		libzstd.so:archivers/zstd \
		libxxhash.so:devel/xxhash
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=19.0:devel/py-packaging@${PY_FLAVOR} \
		${_BB_DEPENDS}
USES=		pkgconfig python ssl
USE_PYTHON=	autoplist distutils
MAKE_ENV=	BORG_OPENSSL_PREFIX=${OPENSSLBASE}

NO_TEST=	yes

OPTIONS_DEFINE=		FUSE
OPTIONS_DEFAULT=	FUSE

FUSE_DESC=	Support to mount locally borg backup files
FUSE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}llfuse>0:devel/py-llfuse@${PY_FLAVOR}

_BORGHOME=${WRKDIR}/testhome
_BORGENV=-i BORG_PASSPHRASE=secret123 PYTHONPATH=${STAGEDIR}${PYTHON_SITELIBDIR} HOME=${_BORGHOME}
post-install:
	${MKDIR} ${STAGEDIR}${MAN1PREFIX}/share/man/man1/
	${INSTALL_MAN} ${WRKSRC}/docs/man/* ${STAGEDIR}${MAN1PREFIX}/share/man/man1/
	${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/borg/ -name "*.so" \
		-exec ${STRIP_CMD} {} \;

.include <bsd.port.mk>
