# $MidnightBSD: mports/databases/ruby-gdbm/Makefile,v 1.1 2008/06/26 19:57:04 laffer1 Exp $

PORTNAME=	gdbm
PORTVERSION=	${RUBY_PORTVERSION}
PORTREVISION=	${RUBY_PORTREVISION}
PORTEPOCH=	1
CATEGORIES=	databases ruby
MASTER_SITES=	# none
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Ruby extension to GDBM library
LICENSE=	gpl2

BUILD_DEPENDS=	${NONEXISTENT}:${PORTSDIR}/${RUBY_PORT}:patch
LIB_DEPENDS=	gdbm:${PORTSDIR}/databases/gdbm

PLIST_FILES=	%%RUBY_ARCHLIBDIR%%/gdbm.so
USE_RUBY=	yes
USE_RUBY_EXTCONF=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}

.include <bsd.port.pre.mk>

MAKE_ARGS=	sitelibdir='$$(rubylibdir)'

do-extract:
	${MKDIR} ${WRKDIR}
	${LN} -sf `cd ${PORTSDIR}/${RUBY_PORT}; ${MAKE} -V WRKDIR`/${PORTNAME} ${WRKDIR}/

.include <bsd.port.post.mk>
