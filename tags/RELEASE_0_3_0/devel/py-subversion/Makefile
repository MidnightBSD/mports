# $MidnightBSD$

PKGNAMEPREFIX=	py-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for version control system
LICENSE=	agg

MASTERDIR=	${.CURDIR}/../../devel/subversion
PKGDIR=		${.CURDIR}

USE_PYTHON=yes

SVN_BUILD_BINDINGS=yes

.include "${MASTERDIR}/Makefile.common"

CATEGORIES+=	python

do-build:
	cd ${WRKSRC} ; ${MAKE} ${FAKE_MAKEARGS} swig-py-lib ; ${MAKE} ${FAKE_MAKEARGS} swig-py

do-install:
	cd ${WRKSRC} ; ${MAKE} ${FAKE_MAKEARGS} install-swig-py

.include <bsd.port.post.mk>
