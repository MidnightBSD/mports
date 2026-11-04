PORTNAME=	bundler
PORTVERSION=	4.0.10
PORTEPOCH=	1
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool that manages gem dependencies for Ruby applications
WWW=		https://bundler.io/ \
		https://github.com/ruby/rubygems/tree/master/bundler

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

USES=		cpe gem

NO_ARCH=	yes

CONFLICTS_INSTALL=	go-tools # bin/bundle

post-install:
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/bin/bundle ${PREFIX}/bin/bundler
.for i in 1 5
	for f in ${PREFIX}/${GEM_LIB_DIR}/lib/bundler/man/*.${i}; do \
		${GZIP_CMD} $${f}; \
		${RLN} $${f}.gz ${PREFIX}/share/man/man${i}/$$(basename $${f}).gz; \
	done
.endfor

.include <bsd.port.mk>
