# $MidnightBSD$

PORTREVISION=	1

PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=

COMMENT=	Python3 bindings for the D-BUS messaging system

SLAVE_PORT=	python3

MASTERDIR=	${.CURDIR}/../../devel/pydbus-common
PLIST=		${.CURDIR}/pkg-plist

BUILD_DEPENDS=  dbus-glib>=0:${PORTSDIR}/devel/dbus-glib
LIB_DEPENDS=    libdbus-1.so:${PORTSDIR}/devel/dbus

.include "${MASTERDIR}/Makefile"
