# New ports collection makefile for:	p5-SNMP_Session
# Date created:				13 June 1999
# Whom:					Stephen J. Roznowski <sjr@home.net>
#
# $FreeBSD: ports/net-mgmt/p5-SNMP_Session/Makefile,v 1.30 2005/12/12 11:09:57 demon Exp $
# $MidnightBSD: mports/net-mgmt/p5-SNMP_Session/Makefile,v 1.1 2006/12/26 00:51:47 laffer1 Exp $
#

PORTNAME=	SNMP_Session
PORTVERSION=	1.08
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	http://www.switch.ch/misc/leinen/snmp/perl/dist/%SUBDIR%/
MASTER_SITE_SUBDIR=	. old
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A perl5 module providing rudimentary access to SNMPv1 and v2 agents
LICENSE=	artistic

PERL_CONFIGURE=	yes

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in README README.SNMP_util index.html
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
