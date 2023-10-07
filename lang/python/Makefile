PORTNAME=	python
PORTVERSION=	${PYTHON_DEFAULT}
PORTREVISION=	3
PORTEPOCH=	2
CATEGORIES=	lang python
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	"meta-port" for the default version of Python interpreter
WWW=		https://www.python.org/

LICENSE=	python

RUN_DEPENDS=	python${PYTHON_MAJOR_VER}:lang/python${PYTHON_MAJOR_VER}

USES=		python:run
NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/2to3 \
		bin/idle \
		bin/pydoc \
		bin/python \
		bin/python-config

.include <bsd.port.pre.mk>

do-install:
	${LN} -sf python${PYTHON_MAJOR_VER} ${PREFIX}/bin/python
	${LN} -sf 2to3-${PYTHON_MAJOR_VER} ${PREFIX}/bin/2to3
.if ${PYTHON_MAJOR_VER} == 2
.for file in idle pydoc
	${LN} -sf ${file}${PYTHON_MAJOR_VER} ${PREFIX}/bin/${file}
.endfor
.elif ${PYTHON_MAJOR_VER} == 3
.for file in idle pydoc
	${LN} -sf ${file}${PYTHON_MAJOR_VER}-${PYTHON_VER} \
		${PREFIX}/bin/${file}
.endfor
.endif
	${LN} -sf python${PYTHON_MAJOR_VER}-config \
		${PREFIX}/bin/python-config

.include <bsd.port.post.mk>
