PORTNAME=	countries
PORTVERSION=	4.1.3
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	All sorts of useful information about every country
WWW=		https://github.com/hexorx/countries

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-i18n_data>=0.15.0<0.16.0:devel/rubygem-i18n_data \
		rubygem-sixarm_ruby_unaccent>=1.1<2:textproc/rubygem-sixarm_ruby_unaccent

USES=		gem

NO_ARCH=	yes

post-patch:
	${REINPLACE_CMD} -e 's|"~> 0.15.0"|">= 0.15.0", "< 0.16.0"|' \
		-e 's|"~> 1.1"|">= 1.1", "< 2"|' \
		${WRKSRC}/${PORTNAME}.gemspec

.include <bsd.port.mk>
