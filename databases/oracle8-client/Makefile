# $MidnightBSD$

PORTNAME=	oracle8-client
PORTVERSION=	0.2.0
PORTREVISION=	3
CATEGORIES=	databases
MASTER_SITES=	FREEBSD_LOCAL/fjoe

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Oracle 8 client

LICENSE=	unknown

USES=		tar:bzip2
ONLY_FOR_ARCHS=	i386
WRKSRC=		${WRKDIR}/${PORTNAME}
ORACLE_HOME=	${PREFIX}/${PORTNAME}

do-build:
	@cd ${WRKSRC}/freebsd && ./redefine-syms.sh ../lib/libclntst8.a
	@cd ${WRKSRC}/freebsd && ${MAKE} all patch clean ORACLE_HOME=${WRKSRC}

do-install:
	@${MKDIR} ${ORACLE_HOME}
	cd ${WRKSRC} && ${FIND} . -not -name '*.orig' -print0 |\
	    ${CPIO} -dump0 -R ${SHAREOWN}:${SHAREGRP} ${ORACLE_HOME}

.include <bsd.port.mk>
