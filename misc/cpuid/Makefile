PORTNAME=	cpuid
PORTVERSION=	3.3
PORTREVISION=	7
CATEGORIES=	misc
MASTER_SITES=	http://www.ka9q.net/code/cpuid/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CPU identification utility
WWW=		http://www.ka9q.net/code/cpuid/

LICENSE=	gpl2

USES=		uidfix
PLIST_FILES=	bin/cpuid

CONFLICTS_INSTALL=	gmap # bin/cpuid

post-patch:
	${MV} ${WRKSRC}/Makefile ${WRKSRC}/Makefile.bak && \
	    ${CP} ${FILESDIR}/Makefile.bsd ${WRKSRC}/Makefile

.include <bsd.port.mk>
