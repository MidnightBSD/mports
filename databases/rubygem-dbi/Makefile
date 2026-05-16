PORTNAME=	dbi
PORTVERSION=	0.4.5
PORTREVISION=	1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vendor independent interface for accessing databases
WWW=		https://github.com/erikh/ruby-dbi

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-deprecated2>=2.0.1:devel/rubygem-deprecated2 \
		rubygem-aspectr>=0:devel/rubygem-aspectr

NO_ARCH=	yes
USES=		gem

PLIST_FILES=	bin/dbi bin/test_broken_dbi

.include <bsd.port.mk>
