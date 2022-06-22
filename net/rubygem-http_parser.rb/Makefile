# Created by: TAKATSU Tomonari <tota@FreeBSD.org>

PORTNAME=	http_parser.rb
PORTVERSION=	0.8.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple callback-based HTTP request/response parser

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE-MIT

USES=		gem
USE_RUBY=	yes

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/
	${LN} -sf ${RUBY} ${FAKE_DESTDIR}${RUBY}

post-install:
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
		${PREFIX}/lib/ruby/gems/2.7/doc/http_parser.rb-0.8.0/rdoc/ext/ruby_http_parser/Makefile.html
	${RM} ${PREFIX}/lib/ruby/gems/2.7/doc/http_parser.rb-0.8.0/rdoc/ext/ruby_http_parser/Makefile.html.bak

.include <bsd.port.mk>
