PORTNAME=	ronn
PORTVERSION=	0.7.3
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Builds manuals
WWW=		https://rtomayko.github.io/ronn/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	rubygem-hpricot>=0.8.2:www/rubygem-hpricot \
		rubygem-rdiscount>=1.5.8:textproc/rubygem-rdiscount \
		rubygem-mustache>=0.7.0:devel/rubygem-mustache

USES=		gem

PLIST_FILES=	bin/ronn

pre-build:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/bin/
	${LN} -sf ${RUBY} ${FAKE_DESTDIR}${RUBY}

post-fake:
	${REINPLACE_CMD} 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}${PREFIX}/bin/ronn 

.include <bsd.port.mk>
