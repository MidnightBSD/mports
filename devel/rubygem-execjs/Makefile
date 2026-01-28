PORTNAME=	execjs
PORTVERSION=	2.10.0
PORTREVISION=	2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ExecJS lets you run JavaScript code from Ruby
WWW=		https://github.com/rails/execjs

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

USES=		gem nodejs:run

NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/lib/execjs/runtimes.rb

.include <bsd.port.mk>
