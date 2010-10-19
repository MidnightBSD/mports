# $MidnightBSD: mports/math/blas/Makefile,v 1.2 2007/10/25 04:07:02 laffer1 Exp $
# $FreeBSD: ports/math/blas/Makefile,v 1.44 2007/09/10 03:04:20 maho Exp $

PORTNAME=	blas
PORTVERSION=	1.0
PORTREVISION=	3
CATEGORIES=	math
MASTER_SITES=	http://www.netlib.org/blas/ \
		http://www.mirrorservice.org/sites/netlib.bell-labs.com/netlib/blas/ \
		ftp://ftp.mirrorservice.org/sites/netlib.bell-labs.com/netlib/blas/ \
		http://netlib.sandia.gov/blas/ \
		http://www.netlib.no/netlib/blas/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic Linear Algebra, level 1, 2, and 3
LICENSE=	unknown

FAKE_OPTS=	trueprefix

USE_LDCONFIG=	yes
USE_FORTRAN=	yes
WRKSRC=		${WRKDIR}/BLAS
SHLIB_MAJOR=	2

PLIST_FILES=	lib/libblas.a lib/libblas.so lib/libblas.so.${SHLIB_MAJOR}

LDFLAGS+=	${FFLAGS}
LDADD ?=	-lgfortran -lm
SRCCONF=	${NONEXISTENT}
MAKE_ENV+=	LDADD="${LDADD}" LDFLAGS="${LDFLAGS}" \
		SHLIB_MAJOR="${SHLIB_MAJOR}" SRCCONF="${SRCCONF}"
.for _u in AR NM RANLIB
MAKE_ENV+=	${_u}="${LOCALBASE}/bin/${_u:L}"
.endfor

OPTIONS=	PROFILE "Build and install a profiling library" Off

.include <bsd.mport.options.mk>

.if defined(WITH_PROFILE)
.if defined(NOPROFILE) || defined(NO_PROFILE) || defined(WITHOUT_PROFILE)
IGNORE =	you have defined WITH_PROFILE, but have also defined\
WITHOUT_PROFILE, NOPROFILE, or NO_PROFILE
.elif !exists(/usr/lib/libc_p.a)
IGNORE	=	you have chosen WITH_PROFILE, but have not installed the\
base system profiling libraries
.endif
PLIST_FILES+=	lib/libblas_p.a
.else
MAKE_ENV+=	NO_PROFILE=
.endif

post-patch:
	@${CP} ${FILESDIR}/makefile.lib ${WRKSRC}/Makefile

.include <bsd.port.mk>
