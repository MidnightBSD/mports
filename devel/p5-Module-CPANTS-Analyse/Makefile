# Created by: Cheng-Lung Sung <clsung@FreeBSD.org>

PORTNAME=	Module-CPANTS-Analyse
PORTVERSION=	0.96
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate Kwalitee ratings for a distribution

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS} \
		p5-ExtUtils-MakeMaker-CPANfile>=0.06:devel/p5-ExtUtils-MakeMaker-CPANfile
RUN_DEPENDS=	p5-Archive-Any-Lite>=0.06:archivers/p5-Archive-Any-Lite \
		p5-Array-Diff>=0.04:misc/p5-Array-Diff \
		p5-CPAN-DistnameInfo>=0.06:devel/p5-CPAN-DistnameInfo \
		p5-Class-Accessor>=0.19:devel/p5-Class-Accessor \
		p5-IO-Capture>=0.05:devel/p5-IO-Capture \
		p5-JSON-MaybeXS>0:converters/p5-JSON-MaybeXS \
		p5-File-Find-Object>=0.2.1:devel/p5-File-Find-Object \
		p5-Module-ExtractUse>=0.330:devel/p5-Module-ExtractUse \
		p5-Module-Pluggable>=2.96:devel/p5-Module-Pluggable \
		p5-Set-Scalar>=0:devel/p5-Set-Scalar \
		p5-Software-License>=0.103008:misc/p5-Software-License \
		p5-Software-License-CCpack>=0:misc/p5-Software-License-CCpack
TEST_DEPENDS=	p5-Test-FailWarnings>=0:devel/p5-Test-FailWarnings

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
