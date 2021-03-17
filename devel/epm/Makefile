# Created by: NAKATA Maho <maho@FreeBSD.org>

PORTNAME=	epm
PORTVERSION=	4.3
CATEGORIES=	devel
MASTER_SITES=	https://github.com/michaelrsweet/epm/releases/download/release-${PORTVERSION}/
EXTRACT_SUFX=	-source.tar.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free UNIX software/file packaging program

LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS

MAKE_JOBS_UNSAFE=	yes
USES=		tar:bzip2
GNU_CONFIGURE=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/bin/mkepmlist

.include <bsd.port.mk>
