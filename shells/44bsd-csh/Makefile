# $MidnightBSD: mports/shells/44bsd-csh/Makefile,v 1.3 2009/12/28 19:26:30 laffer1 Exp $

PORTNAME=	44bsd-csh
PORTVERSION=	20001106
PORTREVISION=	1
CATEGORIES=	shells
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	cy

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The traditional 4.4BSD /bin/csh C-shell
LICENSE=	bsd4

USE_BZIP2=	yes

NO_WRKSUBDIR=	yes
MAN1=		44bsd-csh.1
PORTDOCS=	paper.ascii.gz
post-extract:
	cd ${WRKSRC} ; co RCS/*,v; chmod u+w *
	cd ${WRKSRC}/USD.doc ; co RCS/*,v

post-build:
	cd ${WRKSRC}/USD.doc ; ${MAKE}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/csh ${PREFIX}/bin/44bsd-csh
	${INSTALL_MAN} ${WRKSRC}/csh.1 ${PREFIX}/man/man1/44bsd-csh.1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/USD.doc/paper.ascii.gz ${DOCSDIR}
.endif

tarup:
	cd ${WRKSRC} ; rm * USD.doc/*
	cd ${WRKSRC} ; ${TAR} cvyf /tmp/${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}

.include <bsd.port.mk>
