PORTNAME=	HTML-Table
PORTVERSION=	2.08a
PORTREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate HTML tables for CGI scripts
WWW=		http://www.chime.ucl.ac.uk/~rmhiajp/htmltable/index.htm

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

PORTSCOUT=	skipv:2.08

USES=		perl5
USE_PERL5=	configure

post-extract:
	@${REINPLACE_CMD} -e 's|2.08a|2.08_1|' ${WRKSRC}/lib/HTML/Table.pm
	${RM} ${WRKSRC}/lib/HTML/Table.pm.bak

.include <bsd.port.mk>
