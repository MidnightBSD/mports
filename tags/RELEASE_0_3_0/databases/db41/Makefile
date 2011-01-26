# ports collection makefile for:	Berkeley DB v4
# Date created:				2003-01-04
# Whom:					Matthias Andree <matthias.andree@web.de>
#
# $FreeBSD: ports/databases/db41/Makefile,v 1.60 2006/04/14 03:44:07 mnag Exp $
# $MidnightBSD: mports/databases/db41/Makefile,v 1.4 2007/10/31 19:31:51 laffer1 Exp $
#

PORTNAME=	db41
PORTVERSION=	4.1.25
PORTREVISION=	4
CATEGORIES=	databases
MASTER_SITES=	http://download-east.oracle.com/berkeley-db/ \
		http://download-west.oracle.com/berkeley-db/ \
		http://download-uk.oracle.com/berkeley-db/

PKGNAMESUFFIX?=
DISTNAME?=	db-${PORTVERSION}
DIST_SUBDIR=	bdb

PATCH_SITES=	http://www.oracle.com/technology/products/berkeley-db/db/update/${PORTVERSION}/
PATCHFILES=	patch.${PORTVERSION}.1 patch.${PORTVERSION}.2 patch.${PORTVERSION}.3
PATCH_DIST_STRIP=	-d ${WRKDIR}/${DISTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Berkeley DB package, revision 4.1
LICENSE=	bdb

WRKSRC=		${WRKDIR}/${DISTNAME}/build_unix

INCLUDEDIR=	${PREFIX}/include/${PORTNAME}

GNU_CONFIGURE=	yes
CONFIGURE_SCRIPT=	../dist/configure
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-compat185 --enable-dump185 \
		--enable-cxx --enable-dynamic \
		--includedir=${INCLUDEDIR}
FAKE_OPTS=	prefixhack
FAKE_MAKEARGS+=	includedir=${FAKE_DESTDIR}${INCLUDEDIR}
USE_LDCONFIG=	yes

.if !defined(NOPORTDOCS)
INSTALL_TARGET=	install install_docs
PORTDOCS=	*
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
CONFIGURE_ARGS+=	--with-mutex=x86/gcc-assembly
.endif

post-patch:
	@${REINPLACE_CMD} -Ee \
		's|-l?pthread|${PTHREAD_LIBS}|g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.post.mk>
