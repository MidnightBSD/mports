# $MidnightBSD$

PORTNAME=	MIME-Tools
PORTVERSION=	5.508
PORTEPOCH=	2
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DSKOLL
PKGNAMEPREFIX=	p5-
DISTNAME=	MIME-tools-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of perl5 modules for MIME

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-Convert-BinHex>=0:${PORTSDIR}/converters/p5-Convert-BinHex \
		p5-IO-stringy>=2.11:${PORTSDIR}/devel/p5-IO-stringy \
		p5-Mail-Tools>=1.0203:${PORTSDIR}/mail/p5-Mail-Tools
BUILD_DEPENDS=	${RUN_DEPENDS}
TEST_DEPENDS=	p5-Test-Deep>=0:${PORTSDIR}/devel/p5-Test-Deep

PERL_CONFIGURE=	YES

.if !defined(NOPORTDOCS)
PORTDOCS=	ChangeLog README

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
