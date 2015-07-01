# New ports collection makefile for:	dhcp6
# Date created:		Sept 24, 2008
# Whom:			laffer1
#
# $MidnightBSD$
#

PORTNAME=	dhcp6
PORTVERSION=	20080615
PORTREVISION=	2
CATEGORIES=	net ipv6
MASTER_SITES=	SF/wide-dhcpv6/wide-dhcpv6/wide-dhcpv6-${PORTVERSION}
DISTNAME=	wide-dhcpv6-${PORTVERSION}

FAKE_OPTS=	prefixhack

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KAME DHCP6 client, server, and relay

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--sysconfdir=${LOCALBASE}/etc \
		--with-localdbdir=/var/db
USE_RC_SUBR=	dhcp6c dhcp6relay dhcp6s
PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-install:
	cd ${WRKSRC} && ${INSTALL_DATA} \
	    dhcp6c.conf.sample dhcp6s.conf.sample \
	    ${PREFIX}/etc
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
