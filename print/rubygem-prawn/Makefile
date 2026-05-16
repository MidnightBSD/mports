PORTNAME=	prawn
PORTVERSION=	2.5.0
CATEGORIES=	print rubygems
MASTER_SITES=	RG

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Fast, tiny, and nimble PDF generator for Ruby
WWW=		https://prawnpdf.org/ \
		https://github.com/prawnpdf/prawn

LICENSE=	ruby gpl2 gpl3
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/gpl2
LICENSE_FILE_gpl3=	${WRKSRC}/gpl3
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-matrix>=0.4<1:math/rubygem-matrix \
		rubygem-pdf-core>=0.10.0<0.11:print/rubygem-pdf-core \
		rubygem-ttfunk>=1.8<2:print/rubygem-ttfunk

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
