PORTNAME=	hpricot
PORTVERSION=	0.8.6
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, Enjoyable HTML Parser for Ruby
WWW=		https://github.com/hpricot/hpricot

LICENSE=	mit

USE_RUBY=	yes
USES=		gem

RUBY_VER_SHORT=            ${RUBY_VER:S/.//}

pre-build:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/bin/
	${LN} -sf /usr/local/bin/ruby${RUBY_VER_SHORT} ${FAKE_DESTDIR}${PREFIX}/bin/ruby${RUBY_VER_SHORT}

post-fake:
	${REINPLACE_CMD} 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/hpricot-0.8.6/rdoc/ext/fast_xs/Makefile.html \
		${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/hpricot-0.8.6/rdoc/ext/hpricot_scan/Makefile.html
	-${RM} ${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/hpricot-0.8.6/rdoc/ext/hpricot_scan/Makefile.html.bak \
		${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/hpricot-0.8.6/rdoc/ext/fast_xs/Makefile.html.bak

.include <bsd.port.mk>
