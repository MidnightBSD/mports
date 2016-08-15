# $MidnightBSD$

PORTNAME=	SNMP_Session
PORTVERSION=	1.13
PORTREVISION=	1
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}
PROJECTHOST=	snmp-session
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A perl5 module providing rudimentary access to SNMPv1 and v2 agents
LICENSE=	artistic

PERL_CONFIGURE=	yes

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}

.include <bsd.mport.options.mk>

post-patch:
	${RM} ${WRKSRC}/lib/SNMP_Session.pm.orig

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for file in README README.SNMP_util index.html
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
