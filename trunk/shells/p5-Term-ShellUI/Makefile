# $MidnightBSD$

PORTNAME=	Term-ShellUI
PORTVERSION=	0.92
PORTREVISION=	1
CATEGORIES=	shells perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fully-featured shell-like command line environment

LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/Term/ReadLine/Perl.pm:${PORTSDIR}/devel/p5-ReadLine-Perl

PERL_CONFIGURE=	yes

SAMPLESDIR=	${WRKSRC}/examples

post-install:

.if !defined(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing examples for ${PKGNAME}"
	@${MKDIR} ${EXAMPLESDIR}
.for file in fileman-example synopsis synopsis-big tui-sample
	    @${INSTALL_SCRIPT} ${SAMPLESDIR}/${file}	${EXAMPLESDIR}
.endfor
.endif

.include <bsd.port.mk>
