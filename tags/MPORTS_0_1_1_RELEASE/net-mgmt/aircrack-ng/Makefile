# New ports collection makefile for:	aircrack-ng
# Date created:				2006-05-25
# Whom:					Lars Engels <lars.engels@0x20.net>
#
# $MidnightBSD: mports/net-mgmt/aircrack-ng/Makefile,v 1.1 2007/04/13 21:38:38 laffer1 Exp $
# $FreeBSD: ports/net-mgmt/aircrack-ng/Makefile,v 1.7 2007/01/24 22:39:54 miwi Exp $
#

PORTNAME=	aircrack-ng
PORTVERSION=	0.7
CATEGORIES=	net-mgmt
MASTER_SITES=	http://download.aircrack-ng.org/ \
		http://bsd-geek.de/FreeBSD/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Aircrack-ng is the next generation of aircrack
LICENSE=	gpl2

USE_GMAKE=	yes
ALL_TARGET=	aircrack-ng airdecap-ng packetforge-ng ivstools kstats

PLIST_FILES=	bin/aircrack-ng bin/airdecap-ng bin/packetforge-ng bin/ivstools \
		bin/kstats
MAN1=		aircrack-ng.1 airdecap-ng.1 packetforge-ng.1 ivstools.1

SUB_FILES+=	pkg-message

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/aircrack-ng ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/airdecap-ng ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/packetforge-ng ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/ivstools ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/kstats ${PREFIX}/bin
.for manpage in ${MAN1}
	${INSTALL_MAN} ${WRKSRC}/manpages/${manpage} ${PREFIX}/man/man1
.endfor


.include <bsd.port.post.mk>
