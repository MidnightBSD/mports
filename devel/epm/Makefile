PORTNAME=	epm
PORTVERSION=	4.5.1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/michaelrsweet/epm/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free UNIX software/file packaging program
WWW=		https://www.msweet.org/epm/

LICENSE=	gpl2+

OPTIONS_DEFINE=	DOCS

MAKE_JOBS_UNSAFE=	yes
GNU_CONFIGURE=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/bin/mkepmlist

.include <bsd.port.mk>
