# $MidnightBSD$

PORTREVISION=	2
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	3

COMMENT=	Python 3 bindings for GObject

SLAVE_PORT=	python3

# needed by glib20, an indirect sub depends.
BUILD_DEPENDS+=	python2.7:${PORTSDIR}/lang/python27
BUILD_DEPENDS+=	python2:${PORTSDIR}/lang/python2

MASTERDIR=	${.CURDIR}/../../devel/pygobject3-common
PLIST=		${.CURDIR}/pkg-plist

.include "${MASTERDIR}/Makefile"
