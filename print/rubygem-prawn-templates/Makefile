PORTNAME=	prawn-templates
PORTVERSION=	0.1.2
CATEGORIES=	print rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Include other pdfs or combine several pdf documents into one
WWW=		https://github.com/prawnpdf/prawn-templates

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/gpl2
LICENSE_FILE_gpl3=	${WRKSRC}/gpl3

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-pdf-reader>=2.0<3:print/rubygem-pdf-reader \
		rubygem-prawn>=2.2<3:print/rubygem-prawn

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
