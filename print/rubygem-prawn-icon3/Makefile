PORTNAME=	prawn-icon
PORTVERSION=	3.1.0
CATEGORIES=	print rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	3

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Provide various icon fonts for the Prawn PDF toolkit
WWW=		https://github.com/jessedoyle/prawn-icon

LICENSE=	gpl2 gpl3 ruby
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/gpl2
LICENSE_FILE_gpl3=	${WRKSRC}/gpl3
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-prawn>=1.1.0<3.0.0:print/rubygem-prawn

USES=		gem

NO_ARCH=	yes

PORTSCOUT=	limit:^3\.

.include <bsd.port.mk>
