PORTVERSION=	1.80.0
PORTVERSUFFIX=	${PORTVERSION:C/\.[0-9]+$//}
DISTNAME=	boost_${PORTVERSION:S/./_/g}

CATEGORIES=	devel
MAINTAINER=	ports@MidnightBSD.org

CONFLICTS+=	boost-python-1* boost-1*
MASTER_SITES=	SF/boost/boost/${PORTVERSION} \
		https://boostorg.jfrog.io/artifactory/main/release/${PORTVERSION}/source/ \
		https://boostorg.jfrog.io/artifactory/main/beta/${PORTVERSION}${DISTVERSIONSUFFIX:S/_b/.beta/g}/source/ \

USES+=		tar:bzip2
