# $MidnightBSD$

PORTNAME=	gdbm
PORTVERSION=	${RUBY_PORTVERSION}
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	databases ruby
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
MASTER_SITES=   RUBY/${MASTER_SITE_SUBDIR_RUBY}
DISTNAME=       ${RUBY_DISTNAME}
DIST_SUBDIR=    ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby extension to GDBM library

LICENSE=	ruby bsd2
LICENSE_COMB=	dual

BUILD_DEPENDS=	${NONEXISTENT}:${RUBY_PORT}:patch
LIB_DEPENDS=	libgdbm.so:databases/gdbm

PLIST_FILES=	%%RUBY_ARCHLIBDIR%%/gdbm.so
USES=		tar:xz
USE_RUBY=	yes
USE_RUBY_EXTCONF=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

MAKE_ARGS=	sitelibdir='$$(rubylibdir)' \
		INSTALL_PROG="${INSTALL_PROGRAM}" \
		INSTALL_DATA="${INSTALL_DATA}"

do-extract:
	${MKDIR} ${WRKDIR}
	cd ${WRKDIR} && ${TAR} -xzf ${DISTDIR}/ruby/${DISTFILES} 

post-extract:
	${LN} -sf ${WRKDIR}/ruby-${RUBY_PORTVERSION}/ext/gdbm ${WRKDIR}/gdbm

.include <bsd.port.mk>
