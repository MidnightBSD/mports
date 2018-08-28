# $MidnightBSD$

PORTNAME=	Test-Harness
PORTVERSION=	3.25
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Run perl standard test scripts with statistics
LICENSE=	perl

PERL_CONFIGURE=	yes

PLIST_SUB=	P5_PREFIX="p5"

pre-patch:
	@${MV} ${WRKSRC}/bin/prove ${WRKSRC}/bin/p5prove
	@${PERL} -pi -e "s,^bin/prove$$,bin/p5prove," ${WRKSRC}/MANIFEST
	@${PERL} -pi -e "s,'bin/prove','bin/p5prove'," ${WRKSRC}/Makefile.PL

post-patch:
	@${REINPLACE_CMD} -e '/INSTALLDIRS/d' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
