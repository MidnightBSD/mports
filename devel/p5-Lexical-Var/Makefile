PORTNAME=	Lexical-Var
PORTVERSION=	0.009
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for static variables without namespace pollution

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	modbuild

post-patch:
	@${REINPLACE_CMD} -e '/Lexical::SealRequireHints/d' ${WRKSRC}/Build.PL ${WRKSRC}/lib/Lexical/Var.pm

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Lexical/Var/Var.so

.include <bsd.port.mk>
