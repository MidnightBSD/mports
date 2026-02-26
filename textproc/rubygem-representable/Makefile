PORTNAME=	representable
PORTVERSION=	3.2.0
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Maps Ruby objects to documents and back
WWW=		https://github.com/trailblazer/representable

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-declarative>=0<0.1.0:devel/rubygem-declarative \
		rubygem-trailblazer-option>=0.1.1<0.2.0:devel/rubygem-trailblazer-option \
		rubygem-uber>=0<0.2.0:devel/rubygem-uber

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
