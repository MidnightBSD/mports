PORTNAME=	expense
PORTVERSION=	0.1
PORTREVISION=	2
CATEGORIES=	finance gnustep
MASTER_SITES=	https://www.eskimo.com/~pburns/Expense/files/
DISTNAME=	Expense-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Application to track your expense under GNUstep
WWW=		https://www.eskimo.com/~pburns/Expense/

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Expense

PORTSCOUT=	ignore:1

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Expense.app/Expense

post-patch:
	@${REINPLACE_CMD} -e '/_recordSort/s,^int,NSComparisonResult,' \
		${WRKSRC}/LedgerModel.[hm]

.include <bsd.port.mk>
