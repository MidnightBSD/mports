PORTNAME=	44bsd-csh
PORTVERSION=	20001106
PORTREVISION=	4
CATEGORIES=	shells
MASTER_SITES=	FREEBSD_LOCAL/cy

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The traditional 4.4BSD /bin/csh C-shell

LICENSE=	bsd4

EXTRACT_DEPENDS=	rcs:devel/rcs57

USES=		tar:bzip2
LDFLAGS=	-Wl,--allow-multiple-definition
NO_WRKSUBDIR=	yes
PORTDOCS=	paper.ascii.gz

OPTIONS_DEFINE=	DOCS

post-extract:
	cd ${WRKSRC} ; co RCS/*,v; chmod u+w *
	cd ${WRKSRC}/USD.doc ; co RCS/*,v

post-build:
	cd ${WRKSRC}/USD.doc ; ${MAKE}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/csh ${PREFIX}/bin/44bsd-csh
	${INSTALL_MAN} ${WRKSRC}/csh.1 ${PREFIX}/share/man/man1/44bsd-csh.1
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/USD.doc/paper.ascii.gz ${DOCSDIR}

tarup:
	cd ${WRKSRC} ; rm * USD.doc/*
	cd ${WRKSRC} ; ${TAR} cvyf /tmp/${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}

.include <bsd.port.mk>
