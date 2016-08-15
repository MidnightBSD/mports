# $MidnightBSD$

PORTNAME=		tcptrack
PORTVERSION=		1.3.0
CATEGORIES=		net-mgmt
MASTER_SITES=		http://www.rhythm.cx/~steve/devel/tcptrack/%SUBDIR%/
MASTER_SITE_SUBDIR=	release/${PORTVERSION}/source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Packet sniffer which displays TCP information like top(1)
LICENSE=	gpl2

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/tcptrack
MAN1=		tcptrack.1
PORTDOCS=	AUTHORS ChangeLog INSTALL NEWS README TODO

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
