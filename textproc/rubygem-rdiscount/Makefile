PORTNAME=	rdiscount
PORTVERSION=	2.2.7.3
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast Markdown converter for ruby based on discount
WWW=		https://dafoster.net/projects/rdiscount/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gem

PLIST_FILES=	bin/rdiscount

RUBY_VER_SHORT=            ${RUBY_VER:S/.//}

pre-build:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/bin/
	${LN} -sf /usr/local/bin/ruby${RUBY_VER_SHORT} ${FAKE_DESTDIR}${PREFIX}/bin/ruby${RUBY_VER_SHORT}

post-fake:
	-${REINPLACE_CMD} 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}${PREFIX}/bin/rdiscount \
		${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/rdiscount-${DISTVERSION}/rdoc/ext/Makefile.html
	-${RM} ${FAKE_DESTDIR}${PREFIX}/lib/ruby/gems/${RUBY_VER}/doc/rdiscount-${DISTVERSION}/rdoc/ext/Makefile.html.bak

.include <bsd.port.mk>
