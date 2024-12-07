PORTNAME=	rdoc
PORTVERSION=	6.8.1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDoc produces HTML and command-line documentation for Ruby projects
WWW=		https://ruby.github.io/rdoc/ \
		https://github.com/ruby/rdoc

LICENSE=	gpl2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE.rdoc

RUN_DEPENDS=	rubygem-psych>=4.0.0:textproc/rubygem-psych

USES=		cpe gem

NO_ARCH=	yes

PLIST_FILES=	bin/rdoc bin/ri share/man/man1/ri.1.gz

CPE_VENDOR=	ruby-lang

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/man/man1
	${INSTALL_DATA} ${WRKSRC}/man/ri.1 ${STAGEDIR}${PREFIX}/share/man/man1
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/bin/rdoc ${PREFIX}/bin/ri

.include <bsd.port.mk>
