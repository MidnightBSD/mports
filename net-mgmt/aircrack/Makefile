# $MidnightBSD: mports/net-mgmt/aircrack/Makefile,v 1.2 2007/05/30 00:08:02 ctriv Exp $

PORTNAME=	aircrack
PORTVERSION=	2.41
CATEGORIES=	net-mgmt
MASTER_SITES=	http://mirror.arcticnetwork.ca/pub/gentoo/distfiles/ \
		http://gentoo.llarian.net/distfiles/ \
		http://gentoo.zie.pg.gda.pl/distfiles/ \
		http://www.dvo.ru/pub/distfiles/ \
		http://gentoo.nedlinux.nl/distfiles/ \
		http://bsd-geek.de/FreeBSD/distfiles/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Aircrack is a set of tools for auditing wireless networks
LICENSE=	gpl2

ALL_TARGET=	aircrack airdecap arpforge mergeivs pcap2ivs

PLIST_FILES=	bin/aircrack bin/airdecap bin/arpforge bin/mergeivs bin/pcap2ivs
PORTDOCS=	*

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/aircrack ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/airdecap ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/arpforge ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/mergeivs ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/pcap2ivs ${PREFIX}/bin

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.html ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/README.txt ${DOCSDIR}/
.endif

.include <bsd.port.mk>
