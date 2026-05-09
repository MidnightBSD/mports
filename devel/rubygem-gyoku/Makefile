PORTNAME=	gyoku
DISTVERSION=	1.4.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for translating Ruby hashes to XML
WWW=		https://github.com/savonrb/gyoku

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

RUN_DEPENDS=	rubygem-builder>=2.1.2:devel/rubygem-builder \
		rubygem-rexml>=3.0<4:textproc/rubygem-rexml

USES=		gem

NO_ARCH=	yes

post-patch:
	${REINPLACE_CMD} -e 's|"~> 3.0"|">= 3.0", "< 4"|' ${WRKSRC}/${PORTNAME}.gemspec

.include <bsd.port.mk>
