# $MidnightBSD: mports/databases/db4/Makefile,v 1.3 2007/11/10 23:35:01 laffer1 Exp $

PORTNAME=	db4
PORTVERSION=	4.0.14
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	databases
MASTER_SITES=	http://download.oracle.com/berkeley-db/ 
DISTNAME=	db-${PORTVERSION}
DIST_SUBDIR=	bdb

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Berkeley DB package, revision 4
LICENSE=	bdb

WRKSRC=		${WRKDIR}/${DISTNAME}/build_unix

GNU_CONFIGURE=	yes
CONFIGURE_SCRIPT=	../dist/configure
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
