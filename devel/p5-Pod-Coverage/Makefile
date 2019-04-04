# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Pod-Coverage/Makefile,v 1.13 2007/10/26 21:46:04 mat Exp $

PORTNAME=	Pod-Coverage
PORTVERSION=	0.20
CATEGORIES=	devel textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Checks if the documentation of a module is comprehensive
LICENSE=	perl

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	${SITE_PERL}/Pod/Parser.pm:${PORTSDIR}/textproc/p5-Pod-Parser \
		${SITE_PERL}/Devel/Symdump.pm:${PORTSDIR}/devel/p5-Devel-Symdump

USES=		perl5
USE_PERL5=	modbuild
PERL_MODBUILD=	yes

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes
EXAMPLES=	examples/check_installed examples/script-covered

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${EXAMPLES:S|^|${WRKSRC}/|} ${EXAMPLESDIR}
	@${ECHO_MSG} "===> Examples installed in ${EXAMPLESDIR}."
.endif

.include <bsd.port.mk>
