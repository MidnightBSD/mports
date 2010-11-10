# $MidnightBSD$

PORTNAME=	Path-Class
PORTVERSION=	0.21
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN/../../authors/id/K/KW/KWILLIAMS/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform path specification manipulation
LICENSE=perl

PERL_MODBUILD=	yes

MAN3=		Path::Class.3 \
		Path::Class::File.3 \
		Path::Class::Dir.3

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
