

PORTNAME=	expense
PORTVERSION=	0.1
PORTREVISION=	2
CATEGORIES=	finance gnustep
MASTER_SITES=	https://www.eskimo.com/~pburns/Expense/files/
DISTNAME=	Expense-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Application to track your expense under GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Expense

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Expense.app/Expense

.include <bsd.port.mk>
