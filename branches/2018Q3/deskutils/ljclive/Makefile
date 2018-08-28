# $MidnightBSD$

PORTNAME=	ljclive
PORTVERSION=	0.4.10
PORTREVISION=	1
CATEGORIES=	deskutils
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/clive-${PORTVERSION}
DISTFILES=	clive-${PORTVERSION}.tar.gz		

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line client for posting LiveJournal entries

LICENSE=	bsd3

WRKSRC=		${WRKDIR}/clive-${PORTVERSION}

GNU_CONFIGURE=	yes
USES=		iconv

CONFLICTS=	*clive-[1-9]*
LATEST_LINK=	ljclive

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} 's/iconv "iconv/"iconv/' ${WRKSRC}/configure

.include <bsd.port.post.mk>
