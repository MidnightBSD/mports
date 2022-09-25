PORTNAME=	http_parser.rb
PORTVERSION=	0.8.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple callback-based HTTP request/response parser
WWW=		https://github.com/tmm1/http_parser.rb

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE-MIT

USES=		gem
USE_RUBY=	yes

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/
	${LN} -sf ${RUBY} ${FAKE_DESTDIR}${RUBY}

post-install:
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
		${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/http_parser.rb-${PORTVERSION}/rdoc/ext/ruby_http_parser/Makefile.html \
		${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/http_parser.rb-${PORTVERSION}/ri/ext/ruby_http_parser/page-Makefile.ri
	${RM} ${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/http_parser.rb-${PORTVERSION}/rdoc/ext/ruby_http_parser/Makefile.html.bak \
		${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/http_parser.rb-${PORTVERSION}/ri/ext/ruby_http_parser/page-Makefile.ri.bak

.include <bsd.port.mk>
