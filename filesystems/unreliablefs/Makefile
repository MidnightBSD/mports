PORTNAME=	unreliablefs
DISTVERSION=	0.2.0
CATEGORIES=	filesystems
PKGNAMEPREFIX=	fusefs-
PATCH_SITES=	https://github.com/ligurio/unreliablefs/commit/
PATCHFILES=	e97d259b1cda3c1342c9cb472d31230e50b0776d.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FUSE-based fault injection filesystem
WWW=		https://github.com/ligurio/unreliablefs

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_TEST=	yes

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR} \
		fio:benchmarks/fio

USES=		compiler:c++11-lang cmake fuse pkgconfig python:env
USE_CSTD=	c11
USE_GITHUB=	yes
GH_ACCOUNT=	ligurio

PLIST_FILES=	bin/${PORTNAME} \
		share/man/man1/${PORTNAME}.1.gz \
		share/man/man5/${PORTNAME}.conf.5.gz

.include <bsd.port.mk>
