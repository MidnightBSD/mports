# New ports collection makefile for:	dhcp6
# Date created:		Sept 24, 2008
# Whom:			laffer1
#
# $MidnightBSD: mports/net/dhcp6/Makefile,v 1.1 2008/09/25 01:08:46 laffer1 Exp $
#

PORTNAME=	dhcp6
PORTVERSION=	20080615
CATEGORIES=	net ipv6
MASTER_SITES=	SF/wide-dhcpv6/wide-dhcpv6/wide-dhcpv6-${PORTVERSION}
DISTNAME=	wide-dhcpv6-${PORTVERSION}

FAKE_OPTS=	prefixhack

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KAME DHCP6 client, server, and relay
LICENSE=	bsd3

WRKSRC=		${WRKDIR}/${DISTNAME}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--sysconfdir=${LOCALBASE}/etc --with-localdbdir=/var/db

MAN5=		dhcp6c.conf.5 dhcp6s.conf.5
MAN8=		dhcp6c.8 dhcp6s.8 dhcp6relay.8 dhcp6ctl.8

USE_RC_SUBR=	dhcp6c.sh dhcp6relay.sh dhcp6s.sh

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${WRKSRC}/COPYRIGHT ${DOCSDIR}
.endif
	${INSTALL_DATA} ${WRKSRC}/dhcp6c.conf.sample ${PREFIX}/etc
	${INSTALL_DATA} ${WRKSRC}/dhcp6s.conf.sample ${PREFIX}/etc

.include <bsd.port.mk>
