# $MidnightBSD$

PORTNAME=	Term-ShellUI
PORTVERSION=	0.92
CATEGORIES=	shells perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fully-featured shell-like command line environment
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/Term/ReadLine/Perl.pm:${PORTSDIR}/devel/p5-ReadLine-Perl

PERL_CONFIGURE=	yes

SAMPLESDIR=	${WRKSRC}/examples

MAN3=	Term::ShellUI.3 \
	Text::Shellwords::Cursor.3

post-install:

.if !defined(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing examples for ${PKGNAME}"
	@${MKDIR} ${EXAMPLESDIR}
.for file in fileman-example synopsis synopsis-big tui-sample
	    @${INSTALL_SCRIPT} ${SAMPLESDIR}/${file}	${EXAMPLESDIR}
.endfor
.endif

.include <bsd.port.mk>
