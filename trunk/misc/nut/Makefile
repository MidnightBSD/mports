# $MidnightBSD: mports/misc/nut/Makefile,v 1.3 2011/05/14 03:34:40 laffer1 Exp $
# $FreeBSD: ports/misc/nut/Makefile,v 1.78 2008/03/19 17:32:43 sat Exp $

PORTNAME=	nut
PORTVERSION=	15.7
CATEGORIES=	misc
MASTER_SITES=	SF
PKGNAMEPREFIX=	health-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nutrition software to record what you eat
LICENSE=        gpl

USE_GMAKE=	yes
PORTDOCS=	CREDITS LICENSE README nut.html README.DOS
DOCSDIR=	${PREFIX}/share/doc/${UNIQUENAME}
ALL_TARGET=	${PORTNAME}
PLIST_FILES=	bin/${PORTNAME} %%DATADIR%%/FOOD_DES.txt \
		%%DATADIR%%/NUT_DATA.txt %%DATADIR%%/WEIGHT.lib \
		%%DATADIR%%/WEIGHT.txt %%DATADIR%%/sr22.nut
PLIST_DIRS=	%%DATADIR%%
MAN1=		${PORTNAME}.1

post-patch:
	@${REINPLACE_CMD} -e "s|/usr/local/lib/nut|${DATADIR}|" \
		-e 's|^CFLAGS=|CFLAGS+=|g;s|-Os||;s|gcc|$${CC}|' ${WRKSRC}/Makefile

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	@${INSTALL} -d ${DATADIR}/
	@cd ${WRKSRC}/raw.data/ && ${COPYTREE_SHARE} . ${DATADIR}/
	@${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MAN1PREFIX}/man/man1/
.ifndef NOPORTDOCS
	@${INSTALL} -d ${DOCSDIR}/
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
