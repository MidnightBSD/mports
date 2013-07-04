# New ports collection makefile for:	aircrack-ng
# Date created:				2006-05-25
# Whom:					Lars Engels <lars.engels@0x20.net>
#
# $MidnightBSD$
# $FreeBSD: ports/net-mgmt/aircrack-ng/Makefile,v 1.14 2007/07/12 18:51:59 lme Exp $
#

PORTNAME=	aircrack-ng
PORTVERSION=	0.9.1
CATEGORIES=	net-mgmt
MASTER_SITES=	http://download.aircrack-ng.org/ \
		http://bsd-geek.de/FreeBSD/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Aircrack-ng is the next generation of aircrack with new features
LICENSE=	gpl2

ALL_TARGET=	aircrack-ng airdecap-ng packetforge-ng ivstools kstats makeivs \
		airodump-ng airtun-ng
PLIST_FILES=	bin/aircrack-ng bin/airdecap-ng bin/packetforge-ng bin/ivstools \
		bin/kstats bin/makeivs sbin/airodump-ng sbin/airtun-ng

SUB_FILES=	pkg-message

MAN1=		aircrack-ng.1 airdecap-ng.1 packetforge-ng.1 ivstools.1 \
		makeivs.1 airodump-ng.1 airtun-ng.1 kstats.1
.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} \
		-e 's|/usr/local|${PREFIX}|g' \
		-e 's|-lpthread|${PTHREAD_LIBS}|g;' \
		-e '/^CC/d;' \
			${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/aircrack-ng ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/airdecap-ng ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/packetforge-ng ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/ivstools ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/kstats ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/makeivs ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/airodump-ng ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/airtun-ng ${PREFIX}/sbin

.for manpage in ${MAN1}
	${INSTALL_MAN} ${WRKSRC}/manpages/${manpage} ${PREFIX}/man/man1
.endfor

.include <bsd.port.post.mk>
