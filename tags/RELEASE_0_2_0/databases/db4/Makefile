# ports collection makefile for:	Berkeley DB v4
# Date created:				16 August 2000
# Whom:					Sergey Osokin aka oZZ <ozz@FreeBSD.org.ru>
#
# $FreeBSD: ports/databases/db4/Makefile,v 1.56 2006/05/04 21:39:54 edwin Exp $
# $MidnightBSD: mports/databases/db4/Makefile,v 1.2 2007/05/04 20:20:15 ctriv Exp $
#

PORTNAME=	db4
PORTVERSION=	4.0.14
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	databases
MASTER_SITES=	http://downloads.sleepycat.com/
DISTNAME=	db-${PORTVERSION}
DIST_SUBDIR=	bdb

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Berkeley DB package, revision 4
LICENSE=	bdb

WRKSRC=		${WRKDIR}/${DISTNAME}/build_unix

GNU_CONFIGURE=	yes
CONFIGURE_SCRIPT=	../dist/configure
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-compat185 --enable-dump185 \
		--enable-cxx --enable-dynamic \
		--includedir=${PREFIX}/include/db4
USE_LDCONFIG=	yes


.if !defined(NOPORTDOCS)
INSTALL_TARGET=	install install_docs
PORTDOCS=	*
.endif

# the db install_docs target installs an empty directory, kill it
# (it's not packaged and it's not needed):
.if !defined(NOPORTDOCS)
post-install:
	@${RMDIR} ${PREFIX}/share/doc/db4/ref/splash
.endif

post-patch:
	@${REINPLACE_CMD} -Ee \
		's|-l?pthread|${PTHREAD_LIBS}|g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
