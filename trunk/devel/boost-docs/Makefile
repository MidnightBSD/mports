# $MidnightBSD: mports/devel/boost-docs/Makefile,v 1.1 2012/09/15 19:26:54 laffer1 Exp $

PORTNAME=	boost-docs
PORTVERSION=	1.48.0
PORTVERSUFFIX=	${PORTVERSION:C/\.[0-9]+$//}
CATEGORIES=	devel
MASTER_SITES=	SF/boost/boost/${PORTVERSION}
DISTNAME=	boost_${PORTVERSION:S/./_/g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Documentation for libraries from boost.org
LICENSE=	mit

CONFLICTS=	boost-python-1* boost-1*

USE_BZIP2=	yes

DOCSDIR=	${PREFIX}/share/doc/boost
UNIQ=		/usr/bin/uniq

NO_BUILD=	yes

.include <bsd.port.pre.mk>

do-install:
# Documentation & examples
	${MKDIR} ${DOCSDIR}

	${FIND} ${WRKSRC} -type f -exec ${CHMOD} 0444 {} \;
	${FIND} ${WRKSRC} -type d -exec ${CHMOD} 0755 {} \;
	${FIND} ${WRKSRC} -name ".cvsignore" -delete
	cd ${WRKSRC} &&\
	${FIND} . -name "*.htm" -o -name "*.html"  -o -name "*.css"\
		-o -name "*.jp*g" -o -name "*.png" -o -name "*.gif"\
		| ${TAR} cTf - - | ${TAR} xUCf ${DOCSDIR} -

	cd ${WRKSRC}/libs &&\
	${FIND} . -name "example" -o -name "examples" -o -name "*example*.cpp"\
		-o -name "*example*.c" -o -name "*example*.hpp" | ${UNIQ} |\
		${GREP} -v "assign/test" | ${GREP} -v "iterator/test" | \
		${GREP} -v "range/test" |\
	${TAR} cTf - - | ${TAR} xUCf ${DOCSDIR}/libs -

.include <bsd.port.post.mk>
