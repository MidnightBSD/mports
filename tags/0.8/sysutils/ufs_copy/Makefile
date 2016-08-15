# $MidnightBSD$

PORTNAME=	ufs_copy
PORTVERSION=	20060921
CATEGORIES=	sysutils
MASTER_SITES=	http://people.freebsd.org/~simokawa/ufs/
DISTNAME=	ufs-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast copy utility for UFS filesystem

LICENSE=	bsd4

WRKSRC=		${WRKDIR}/ufs
MAKE_ARGS=	BINDIR=${PREFIX}/sbin

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA}	${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
