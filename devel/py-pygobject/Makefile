PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PORTREVISION=	1

COMMENT=	Python ${PYTHON_VER} bindings for GObject

SLAVE_PORT=	python

MAKE_JOBS_UNSAFE=	yes

MASTERDIR=	${.CURDIR}/../../devel/pygobject-common
PLIST=		${.CURDIR}/pkg-plist

PLIST_SUB+=	PYTHON_VER=${PYTHON_VER}

NO_TEST=	yes
MESON_ARGS+=	-Dtests=false

.include "${MASTERDIR}/Makefile"
