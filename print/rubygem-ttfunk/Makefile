PORTNAME=	ttfunk
PORTVERSION=	1.8.0
PORTREVISION=	1
CATEGORIES=	print rubygems
MASTER_SITES=	RG

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Font Metrics Parser for the Prawn PDF generator
WWW=		https://github.com/prawnpdf/ttfunk

LICENSE=	ruby gpl2 gpl3
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/GPLv2
LICENSE_FILE_gpl3=	${WRKSRC}/GPLv3
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-bigdecimal>=3.1<5:math/rubygem-bigdecimal

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
