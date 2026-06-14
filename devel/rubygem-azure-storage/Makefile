PORTNAME=	azure-storage
PORTVERSION=	0.15.0p0
PORTREVISION=	1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG
DISTNAME=	${PORTNAME}-0.15.0.preview

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Microsoft Azure Storage Client Library for Ruby
WWW=		https://github.com/Azure/azure-storage-ruby

LICENSE=	mit

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-azure-core>=0.1<1:net/rubygem-azure-core \
		rubygem-faraday0>=0.9<1:www/rubygem-faraday0 \
		rubygem-faraday_middleware0>=0.10<1:www/rubygem-faraday_middleware0 \
		rubygem-nokogiri>=1.6.8<2:textproc/rubygem-nokogiri

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
