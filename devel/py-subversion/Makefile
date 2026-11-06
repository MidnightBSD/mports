PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for version control system
WWW=		https://subversion.apache.org/

LICENSE=	agg

BUILD_DEPENDS=	${LOCALBASE}/include/py3c.h:devel/py3c

USES=		python
USE_PYTHON=	flavors py3kplist

# There is bug in python bindings Makefile
MAKE_JOBS_UNSAFE=yes

PORTREVISION_LATEST=	0
PORTREVISION_LTS=		0

SVN_BUILD_BINDINGS=	yes

.include "${.CURDIR}/../../devel/subversion/Makefile.addons"

CATEGORIES+=	python

.if ${WITH_SUBVERSION_VER:U114} == 114
BUILD_RUN_DEPENDS+=	subversion>=1.15.0:devel/subversion
.endif

CONFIGURE_ARGS+=	--with-swig-python=${PYTHON_CMD} \
			--without-swig-perl \
			--without-swig-ruby \
			--without-gnome-keyring \
			--without-kwallet \
			--with-apxs=no

ALL_TARGET=	swig-py check-swig-py
INSTALL_TARGET=	install-swig-py

.include <bsd.port.post.mk>
