# $MidnightBSD$

PORTNAME=	Digest-SHA
PORTVERSION=	5.95
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for SHA-1/224/256/384/512

LICENSE=	artistic gpl
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-Test-Pod>=1:${PORTSDIR}/devel/p5-Test-Pod \
		p5-Test-Pod-Coverage>=0.08:${PORTSDIR}/devel/p5-Test-Pod-Coverage

USES=		perl5
PERL_CONFIGURE=	yes
CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd10.4
 
post-patch:
	@${REINPLACE_CMD} -e '/EXE_FILES/d' ${WRKSRC}/Makefile.PL

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Digest/SHA/SHA.so

.include <bsd.port.mk>
