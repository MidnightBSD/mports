PORTNAME=	pdf-core
PORTVERSION=	0.9.0
CATEGORIES=	print rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	09

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby library to render PDF documents
WWW=		https://prawnpdf.org/ \
		https://github.com/prawnpdf/pdf-core

LICENSE=	gpl2 gpl3 ruby
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/GPLv2
LICENSE_FILE_gpl3=	${WRKSRC}/GPLv3
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^0\.9\.

.include <bsd.port.mk>
