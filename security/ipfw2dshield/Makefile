# Created by: Frank W. Josellis <frank@dynamical-systems.org>

PORTNAME=	ipfw2dshield
PORTVERSION=	0.5
CATEGORIES=	security
MASTER_SITES=	http://www.dynamical-systems.org/ipfw/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DShield client for ipfw logs

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

PORTDOCS=	CHANGES README.html README.txt

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${TRUE_PREFIX}|g' \
		-e 's/FreeBSD/MidnightBSD/g' ${WRKSRC}/ipfw2dshield
	@${REINPLACE_CMD} -E -e '/^(CC|CFLAGS|prefix)/ s|=|?=|' \
		-e 's|bindir)|DESTDIR)$$(&|' \
		${WRKSRC}/ipaddr/Makefile \
		${WRKSRC}/strpdate/Makefile

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
