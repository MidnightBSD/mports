# Created by: Alexander Churanov <churanov.port.maintainer@gmail.com>
# $MidnightBSD$

PORTNAME=	boost-all
MASTER_SITES=   #
DISTFILES=      #
EXTRACT_ONLY=   #

NO_BUILD=	yes

COMMENT?=	The "meta-port" for boost libraries

OPTIONS_DEFINE=	JAM LIBRARIES PYTHON DOCS
OPTIONS_DEFAULT=	JAM LIBRARIES
JAM_DESC=	Boost.Jam - Build tool from the boost.org
LIBRARIES_DESC=	Free portable C++ libraries
PYTHON_DESC=	Boost.Python - interfacing Python and C++

.include "common.mk"

LIBRARIES_RUN_DEPENDS=	${LOCALBASE}/lib/libboost_thread.so:devel/boost-libs
JAM_RUN_DEPENDS=	${LOCALBASE}/bin/bjam:devel/boost-jam
PYTHON_RUN_DEPENDS=	${LOCALBASE}/lib/${PY_BOOST}
PYTHON_USES=		python:env
DOCS_RUN_DEPENDS=	${LOCALBASE}/share/doc/boost/doc/html/index.html:devel/boost-docs

do-install:
	${MKDIR} ${WRKSRC}
	${TOUCH} ${PREFIX}/share/boost-all

.include <bsd.port.mk>
