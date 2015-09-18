# $MidnightBSD$

PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	3

COMMENT=	Python 2 bindings for GObject

SLAVE_PORT=	python2

MASTERDIR=	${.CURDIR}/../../devel/pygobject3-common
PLIST=		${.CURDIR}/pkg-plist

PLIST_SUB+=	PYTHON_VER=${PYTHON_VER}

.include "${MASTERDIR}/Makefile"
