PORTNAME=	drydock
PORTVERSION=	1.0.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build seaworthy command-line apps with a powerful Ruby DSL
WWW=		https://github.com/delano/drydock

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	rubygem-ostruct>=0.6<1:devel/rubygem-ostruct
RUN_DEPENDS=	rubygem-ostruct>=0.6<1:devel/rubygem-ostruct

USES=		gem shebangfix

NO_ARCH=	yes

SHEBANG_FILES=	bin/example

post-install:
	${RM} ${STAGEDIR}${PREFIX}/bin/example

.include <bsd.port.mk>
