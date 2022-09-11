PORTNAME=	OLE-Storage_Lite
PORTVERSION=	0.20
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for OLE document interface

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-IO-Stringy>=0:devel/p5-IO-Stringy
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		dos2unix perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
