PORTNAME=	hpricot
PORTVERSION=	0.8.6
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, Enjoyable HTML Parser for Ruby

LICENSE=	mit

USE_RUBY=	yes
USES=		gem

pre-build:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/bin/
	${LN} /usr/local/bin/ruby26 ${FAKE_DESTDIR}${PREFIX}/bin/ruby26

post-fake:
	${REINPLACE_CMD} 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/2.6/doc/hpricot-0.8.6/rdoc/ext/fast_xs/Makefile.html \
		${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/2.6/doc/hpricot-0.8.6/rdoc/ext/hpricot_scan/Makefile.html

.include <bsd.port.mk>
