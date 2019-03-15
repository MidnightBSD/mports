# $MidnightBSD$

PORTNAME=	SNMP_Session
PORTVERSION=	1.13
PORTREVISION=	3
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	http://pkgs.fedoraproject.org/repo/pkgs/perl-SNMP_Session/SNMP_Session-1.13.tar.gz/055e1065babf55f1f8606329c6bdb947/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module providing rudimentary access to SNMPv1 and v2 agents

LICENSE=	artistic

USES=		perl5
USE_PERL5=	configure

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-patch:
	${RM} ${WRKSRC}/lib/SNMP_Session.pm.orig

post-install:
	@${MKDIR} ${DOCSDIR}
.for file in README README.SNMP_util index.html
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor


.include <bsd.port.mk>
