# $MidnightBSD$

PORTNAME=	ExtUtils-MakeMaker
PORTVERSION=	6.66
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Designed to write a Makefile for an extension module
LICENSE=	perl

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501400
BUILD_DEPENDS+=	p5-ExtUtils-Manifest>=1.58:${PORTSDIR}/devel/p5-ExtUtils-Manifest \
		p5-version>=0.88:${PORTSDIR}/devel/p5-version
RUN_DEPENDS+=	p5-ExtUtils-Manifest>=1.58:${PORTSDIR}/devel/p5-ExtUtils-Manifest \
		p5-version>=0.88:${PORTSDIR}/devel/p5-version
.endif

.if ${PERL_LEVEL} < 501600
BUILD_DEPENDS+=	p5-CPAN-Meta>=2.112150:${PORTSDIR}/devel/p5-CPAN-Meta
RUN_DEPENDS+=	p5-CPAN-Meta>=2.112150:${PORTSDIR}/devel/p5-CPAN-Meta
.endif

post-patch:
	@${REINPLACE_CMD} -e '/EXE_FILES/d; /my::bundles/d' ${WRKSRC}/Makefile.PL
	@${REINPLACE_CMD} -e '/^bundled\//d' ${WRKSRC}/MANIFEST
	@${RM} -fr ${WRKSRC}/bundled/
	@[ -e ${LOCALBASE}/lib/perl5/${PERL_VERSION}/mach/CORE/cc_runtime.h ] || \
		${SED} -i '' -e '/cc_runtime.h/d' ${WRKSRC}/lib/ExtUtils/MM_Unix.pm

.include <bsd.port.post.mk>
