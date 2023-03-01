# New ports collection makefile for:	p5-String-Approx
# Date created:				7 Nov 2007
# Whom:	      				Lucas Holt <luke@midnightbsd.org>

PORTNAME=	String-Approx
PORTVERSION=	3.28
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for approximate matching (fuzzy matching)
WWW=		https://metacpan.org/release/String-Approx

LICENSE=	artistic2 lgpl
LICENSE_COMB=	dual
LICENSE_FILE_artistic2=	${WRKSRC}/Artistic
LICENSE_FILE_lgpl=	${WRKSRC}/LGPL

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/String/Approx/Approx.so

.include <bsd.port.mk>
