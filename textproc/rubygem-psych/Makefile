PORTNAME=	psych
PORTVERSION=	5.2.0
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	YAML parser and emitter
WWW=		https://github.com/ruby/psych

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libyaml.so:textproc/libyaml
RUN_DEPENDS=	rubygem-stringio>=0:devel/rubygem-stringio

USES=		gem

.include <bsd.port.mk>
