PORTNAME=	net-protocol
PORTVERSION=	0.1.3
CATEGORIES=	net rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	01

MAINTAINER=	mfechner@FreeBSD.org
COMMENT=	Abstruct interface for net-* client
WWW=		https://github.com/ruby/net-protocol

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	rubygem-timeout>=0:devel/rubygem-timeout

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^0\.1\.

.include <bsd.port.mk>
