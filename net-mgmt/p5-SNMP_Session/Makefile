# $MidnightBSD: mports/net-mgmt/p5-SNMP_Session/Makefile,v 1.2 2007/06/06 18:35:21 ctriv Exp $

PORTNAME=	SNMP_Session
PORTVERSION=	1.13
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}
PROJECTHOST=	snmp-session
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A perl5 module providing rudimentary access to SNMPv1 and v2 agents
LICENSE=	artistic

PERL_CONFIGURE=	yes

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}

post-patch:
	${RM} ${WRKSRC}/lib/SNMP_Session.pm.orig

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in README README.SNMP_util index.html
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
