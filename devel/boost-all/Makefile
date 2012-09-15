# $MidnightBSD: mports/devel/boost-all/Makefile,v 1.1 2012/09/15 19:26:54 laffer1 Exp $

PORTNAME=	boost-all
PORTVERSION=    1.48.0
PORTVERSUFFIX=  ${PORTVERSION:C/\.[0-9]+$//}
CATEGORIES=	devel
DISTNAME=       boost_${PORTVERSION:S/./_/g}

MASTER_SITES=	# empty
DISTFILES=	# none
EXTRACT_ONLY=	# empty

MAINTAINER=     ports@MidnightBSD.org
COMMENT?=	The "meta-port" for boost libraries
LICENSE=	mit

CONFLICTS=     boost-python-1* boost-1*

OPTIONS=	JAM "Boost.Jam - Build tool from the boost.org" on \
		LIBRARIES "Free portable C++ libraries" on \
		PYTHON "Boost.Python - interfacing Python and C++" off \
		DOCS "Documentation & examples" on

NO_BUILD=	yes

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_LIBRARIES)
RUN_DEPENDS+=	${LOCALBASE}/lib/libboost_thread.so:${PORTSDIR}/devel/boost-libs
.endif

.if !defined(WITHOUT_JAM)
RUN_DEPENDS+=	${LOCALBASE}/bin/bjam:${PORTSDIR}/devel/boost-jam
.endif

.if !defined(WITHOUT_PYTHON)
RUN_DEPENDS+=	${LOCALBASE}/lib/libboost_python.so:${PORTSDIR}/devel/boost-python-libs
.endif

.if !defined(WITHOUT_DOCS)
RUN_DEPENDS+=	${LOCALBASE}/share/doc/boost/doc/html/index.html:${PORTSDIR}/devel/boost-docs
.endif

do-install:
	${DO_NADA}

.include <bsd.port.post.mk>
