# $MidnightBSD: mports/databases/oracle8-client/Makefile,v 1.1 2009/12/30 19:22:41 laffer1 Exp $

PORTNAME=	oracle8-client
PORTVERSION=	0.2.0
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	fjoe

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Oracle 8 client
LICENSE=	unknown

USE_BZIP2=	yes
ONLY_FOR_ARCHS=	i386
WRKSRC=		${WRKDIR}/${PORTNAME}
ORACLE_HOME=	${PREFIX}/${PORTNAME}

.include <bsd.port.pre.mk>

do-build:
	@cd ${WRKSRC}/freebsd && ./redefine-syms.sh ../lib/libclntst8.a
	@cd ${WRKSRC}/freebsd && ${MAKE} all patch clean ORACLE_HOME=${WRKSRC}

do-install:
	@${MKDIR} ${ORACLE_HOME}
	cd ${WRKSRC} && ${FIND} . -not -name '*.orig' -print0 |\
	    ${CPIO} -dump0 -R ${SHAREOWN}:${SHAREGRP} ${ORACLE_HOME}

.include <bsd.port.post.mk>
