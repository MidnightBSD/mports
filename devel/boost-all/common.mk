# $MidnightBSD$

PORTVERSION=	1.55.0
PORTVERSUFFIX=	${PORTVERSION:C/\.[0-9]+$//}
DISTNAME=	boost_${PORTVERSION:S/./_/g}

CATEGORIES=	devel
MAINTAINER=	ports@MidnightBSD.org

CONFLICTS+=	boost-python-1* boost-1*
MASTER_SITES=	SF/boost/boost/${PORTVERSION}

USES+=		tar:bzip2
