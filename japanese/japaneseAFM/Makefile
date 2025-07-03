PORTNAME=	japaneseAFM
PORTVERSION=	1.0
CATEGORIES=	japanese print
MASTER_SITES=	FREEBSD_LOCAL/kiri
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese AFM fonts

LICENSE=	NONE

NO_WRKSUBDIR=	yes
NO_BUILD=	yes

AFMDIR=		${PREFIX}/share/fonts/afm

do-install:
	@${MKDIR} ${STAGEDIR}${AFMDIR}
.for font in GothicBBB-Medium Ryumin-Light
.for dir in H V
	${INSTALL_DATA} ${WRKSRC}/${font}-${dir} ${STAGEDIR}${AFMDIR}
.endfor
.endfor

.include <bsd.port.mk>
