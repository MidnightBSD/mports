PORTNAME=	prawn-table
PORTVERSION=	0.2.2
CATEGORIES=	print rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide tables for the Prawn PDF toolkit
WWW=		https://github.com/prawnpdf/prawn-table

LICENSE=	gpl2 gpl3 ruby
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/gpl2
LICENSE_FILE_gpl3=	${WRKSRC}/gpl3
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-prawn>=1.3.0<3.0.0:print/rubygem-prawn

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
