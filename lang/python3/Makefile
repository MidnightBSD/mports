PORTNAME=	python3
PORTVERSION=	3
PORTREVISION=	2
CATEGORIES=	lang python ipv6
MASTER_SITES=
DISTFILES=
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Meta-port for the Python interpreter 3.x
WWW=		https://www.python.org/

LICENSE=	bsd2

USES=		python:run
NO_BUILD=	yes

PLIST_FILES=	bin/2to3-${PYTHON_MAJOR_VER} \
		bin/idle${PYTHON_MAJOR_VER} \
		bin/pydoc${PYTHON_MAJOR_VER} \
		bin/python${PYTHON_MAJOR_VER} \
		bin/python${PYTHON_MAJOR_VER}-config \
		bin/python-shared${PYTHON_MAJOR_VER} \
		bin/python-shared${PYTHON_MAJOR_VER}-config \
		libdata/pkgconfig/python${PYTHON_MAJOR_VER}.pc

.include <bsd.port.pre.mk>

RUN_DEPENDS+=	${PYTHON_CMD}:${PYTHON_PORTSDIR}

do-install:
.for file in python python-shared
	${LN} -sf ${file}${PYTHON_VER} \
		${PREFIX}/bin/${file}${PYTHON_MAJOR_VER}
.endfor
	${LN} -sf 2to3-${PYTHON_VER} \
		${PREFIX}/bin/2to3-${PYTHON_MAJOR_VER}
.for file in idle pydoc
	${LN} -sf ${file}${PYTHON_MAJOR_VER}-${PYTHON_VER} \
		${PREFIX}/bin/${file}${PYTHON_MAJOR_VER}
.endfor
	${LN} -sf python${PYTHON_VER}-config \
		${PREFIX}/bin/python${PYTHON_MAJOR_VER}-config
	${LN} -sf python-shared${PYTHON_VER}-config \
		${PREFIX}/bin/python-shared${PYTHON_MAJOR_VER}-config
	${LN} -sf python-${PYTHON_VER}.pc \
		${PREFIX}/libdata/pkgconfig/python${PYTHON_MAJOR_VER}.pc

.include <bsd.port.post.mk>
