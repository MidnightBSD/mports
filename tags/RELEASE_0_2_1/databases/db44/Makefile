# ports collection makefile for:	Berkeley DB v4.4
# Date created:				2005-11-21
# Whom:					Matthias Andree <matthias.andree@gmx.de>
#
# $FreeBSD: ports/databases/db44/Makefile,v 1.77 2006/04/14 03:44:08 mnag Exp $
# $MidnightBSD: mports/databases/db44/Makefile,v 1.2 2007/11/10 23:33:10 laffer1 Exp $
#

PORTNAME=	db44
PORTVERSION=	4.4.20.4
CATEGORIES=	databases
MASTER_SITES=	http://download-west.oracle.com/berkeley-db/ \
		http://download-east.oracle.com/berkeley-db/ \
		http://download-uk.oracle.com/berkeley-db/
PKGNAMESUFFIX?=
DISTNAME=	db-4.4.20
DIST_SUBDIR=	bdb

PATCH_SITES=	http://www.oracle.com/technology/products/berkeley-db/db/update/4.4.20/
PATCHFILES=	patch.4.4.20.1 patch.4.4.20.2 patch.4.4.20.3 patch.4.4.20.4
PATCH_DIST_STRIP=	-d ..
# * patch.4.4.20.1: -----------------------------------------------------------
# Fix a bug that could cause a trap during recovery if multiple operations that
# could remove the same extent were recovered. [#14061]
# * patch.4.4.20.2: -----------------------------------------------------------
# Fix a bug that could cause traps or hangs if the DB_TXN->set_name function is
# used in a multithreaded application. [#14033]

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Berkeley DB package, revision 4.4
LICENSE=	bdb

WRKSRC=		${WRKDIR}/${DISTNAME}/build_unix

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_SCRIPT=	../dist/configure
LIBTOOLFILES=		${CONFIGURE_SCRIPT}
BDBVER=			${PORTVERSION:R:R}
CONFIGURE_ARGS=		--enable-compat185 --enable-dump185 \
			--enable-cxx --enable-dynamic \
			--enable-rpc \
			--includedir=${PREFIX}/include/${PORTNAME} \
			--libdir=${PREFIX}/lib/${PORTNAME} \
			--bindir=${PREFIX}/bin/${PORTNAME}
INSTALL_TARGET=		install_include install_lib install_utilities
.if !defined(NOPORTDOCS)
INSTALL_TARGET+=	install_docs docdir=${DOCSDIR}
PORTDOCS=		*
.endif

pre-patch:
	@${REINPLACE_CMD} -Ee 's|-l?pthread|${PTHREAD_LIBS}|g' ${WRKSRC}/${CONFIGURE_SCRIPT}

pre-configure:
	@${CHMOD} u+w ${WRKSRC}/../dist/configure

post-configure:
	@${REINPLACE_CMD} -e '/^extern  void db_rpc_serverprog/ d;' ${WRKSRC}/db_server.h

post-install:
.for i in libdb libdb_cxx
	${LN} -s -f ${PORTNAME}/${i}-${BDBVER}.so.0 ${PREFIX}/lib
	${LN} -s -f ${i}-${BDBVER}.so.0 ${PREFIX}/lib/${i}-${BDBVER}.so
.endfor
.if !defined(NOPORTDOCS)
	@${RMDIR} ${DOCSDIR}/ref/splash 2>/dev/null || :
.endif
	cd ${PREFIX}/bin/${PORTNAME} ; \
	for i in * ; do ${LN} -s -f ${PORTNAME}/$$i ../$$i-${BDBVER} ; done

.include <bsd.port.mk>
