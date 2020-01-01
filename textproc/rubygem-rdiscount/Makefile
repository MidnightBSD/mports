PORTNAME=	rdiscount
PORTVERSION=	2.2.0.1
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast Markdown converter for ruby based on discount

LICENSE=	bsd3

USE_RUBY=	yes
USES=		gem

PLIST_FILES=	bin/rdiscount

pre-build:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/bin/
	${LN} /usr/local/bin/ruby26 ${FAKE_DESTDIR}${PREFIX}/bin/ruby26

post-fake:
	${REINPLACE_CMD} 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}${PREFIX}/bin/rdiscount \
		${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/2.6/doc/rdiscount-2.2.0.1/rdoc/ext/Makefile.html
	${RM} ${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/2.6/doc/rdiscount-2.2.0.1/rdoc/ext/Makefile.html.bak

.include <bsd.port.mk>
