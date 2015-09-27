# $MidnightBSD$

PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for version control system
LICENSE=	agg

MASTERDIR=	${.CURDIR}/../../devel/subversion
PKGDIR=		${.CURDIR}

USES+=		python

SVN_BUILD_BINDINGS=	yes
SVN_BUILD_ADDONS=	yes

.include "${MASTERDIR}/Makefile.common"

CATEGORIES+=	python

CONFIGURE_ARGS+=	--without-gnome-keyring \
			--without-kwallet \
			--with-apxs=no

do-build:
	cd ${WRKSRC} ; ${MAKE} ${FAKE_MAKEARGS} swig-py-lib ; ${MAKE} ${FAKE_MAKEARGS} swig-py

do-install:
	cd ${WRKSRC} ; ${MAKE} ${FAKE_MAKEARGS} install-swig-py

.include <bsd.port.post.mk>
