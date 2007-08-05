# New ports collection makefile for:	tcptrack
# Date created:		2004-10-11
# Whom:			Tor Halvard "Squat" Furulund <squat@squat.no>
#
# $FreeBSD: ports/net-mgmt/tcptrack/Makefile,v 1.4 2005/04/12 03:26:20 obrien Exp $
# $MidnightBSD: mports/net-mgmt/tcptrack/Makefile,v 1.1 2006/12/26 02:20:56 laffer1 Exp $
#

PORTNAME=		tcptrack
PORTVERSION=		1.1.5
CATEGORIES=		net-mgmt
MASTER_SITES=		http://www.rhythm.cx/~steve/devel/tcptrack/
MASTER_SITE_SUBDIR=	release/${PORTVERSION}/source/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Packet sniffer which displays TCP information like top(1)
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}

PLIST_FILES=	bin/tcptrack
MAN1=		tcptrack.1
PORTDOCS=	AUTHORS ChangeLog INSTALL NEWS README TODO

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
