PORTNAME=	rdoc
PORTVERSION=	6.4.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDoc produces HTML and command-line documentation for Ruby projects

LICENSE=	gpl2 ruby
LICENSE_COMB=	dual

USES=		gem
USE_RUBY=	yes

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${RUBY_VER} >= 2.7
PLIST_FILES=	bin/rdoc bin/ri share/man/man1/ri.1.gz

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/man/man1
	${INSTALL_DATA} ${WRKSRC}/man/ri.1 ${STAGEDIR}${PREFIX}/share/man/man1
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/bin/rdoc ${PREFIX}/bin/ri

.elif ${RUBY_VER} == 2.6
# WIP: rdoc wrapper script is installed by ruby port so far, see bug 241554, 237833
post-install:
	${RM} ${STAGEDIR}${PREFIX}/bin/rdoc ${STAGEDIR}${PREFIX}/bin/ri
.else
IGNORE=         ${PORTNAME} is included in lang/${RUBY_NAME}
.endif

.include <bsd.port.post.mk>
