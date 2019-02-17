# $MidnightBSD$

PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for version control system

LICENSE=	agg

USES+=		python
USE_PYTHON=	flavors py3kplist

PORTREVISION_111=	0
PORTREVISION_19=	0

SVN_BUILD_BINDINGS=	yes

.include "${.CURDIR}/../../devel/subversion/Makefile.addons"

CATEGORIES+=	python

CONFIGURE_ARGS+=	--without-gnome-keyring \
			--without-kwallet \
			--with-apxs=no

ALL_TARGET=	swig-py-lib swig-py
INSTALL_TARGET=	install-swig-py

.include <bsd.port.post.mk>
